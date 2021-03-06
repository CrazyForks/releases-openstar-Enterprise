LJ1  -  - 9   B C  �$�MMDB_strerror0  -  - 9   B C  ��gai_strerror�  -    X�- 9   )  - B-  X�+  -  B I 1  - - - 9B-  L &�$�%��'��MMDB_closeMMDB_open    -   L  &�� �   X�+  -  J :  9 99+  -  X0�4  9:  9 )   X��   X��U%�:  9 99-  X�+  -  J - 9	 B  X�+  -	 J +  :	  9 	-	 
  B	 
  	 -	 	 X	�+	  
 J	 < X�Xr�:  9 9-  X�:  9 94  :  9 )  Xc�   Xa�U�+  -	 
  B	 
  	 -	 	 X	�,	
  J	 < X�XO�:  9 99+  -  X�- 9	 B   X=�- +   J X8�-  X�- -	 '	 9
B	 B   X+�- +   J X&�-
  X�9X!�-  X�9X�-  X�9	X�-  X�9
X�-  X�9X�-  X�9X�-  X�9X�+  -  J  :  9 -     J �����)������#���"���
int32uint64booleanuint32uint16float_valuedouble_value
byteschar * utf8_string	nextdata_size	typeentry_data� 	 W-    X�+  '  J - ' B- ' B- 9-     B: -  X�+  ' - : B&J : -  X�+  ' - : B&J 9
 X�+  ' J - ' - ' B A- 99	 B-  X�+  '
 - 	 B&J : -  B-
 9

 B
-
 
 X
�+
  ' -  B&J
 L	 &��$�%��'�(��)�dump entry data failed: MMDB_free_entry_data_listget entry data failed: 
entryMMDB_get_entry_data_listMMDB_entry_data_list_s#MMDB_entry_data_list_s **constnot foundfound_entrylookup failed: MMDB_lookup_stringint[1]not initialized� +  >6   ' B 9 9 9 9 9 4  ' =5	 =
9 '	 B)  )	 )
 ) ) ) ) ) ) )	 )
 ) )  ) ) ) ) ) ) ) ) )	 )
 ) )  )! )" )# 9$ '% B$% '& B%+& 3' 3( 3) =)3) =)3) 3* =*2  �L  lookup  initted 	init  MMDB_slibmaxminddb	load�
typedef long int ssize_t;

typedef unsigned int mmdb_uint128_t __attribute__ ((__mode__(TI)));

typedef struct MMDB_entry_s {
  struct MMDB_s *mmdb;
  uint32_t offset;
} MMDB_entry_s;

typedef struct MMDB_lookup_result_s {
  bool found_entry;
  MMDB_entry_s entry;
  uint16_t netmask;
} MMDB_lookup_result_s;

typedef struct MMDB_entry_data_s {
  bool has_data;
  union {
    uint32_t pointer;
    const char *utf8_string;
    double double_value;
    const uint8_t *bytes;
    uint16_t uint16;
    uint32_t uint32;
    int32_t int32;
    uint64_t uint64;
    mmdb_uint128_t uint128;
    bool boolean;
    float float_value;
  };

  uint32_t offset;
  uint32_t offset_to_next;
  uint32_t data_size;
  uint32_t type;
} MMDB_entry_data_s;

typedef struct MMDB_entry_data_list_s {
  MMDB_entry_data_s entry_data;
  struct MMDB_entry_data_list_s *next;
} MMDB_entry_data_list_s;

typedef struct MMDB_description_s {
  const char *language;
  const char *description;
} MMDB_description_s;

typedef struct MMDB_metadata_s {
  uint32_t node_count;
  uint16_t record_size;
  uint16_t ip_version;
  const char *database_type;
  struct {
    size_t count;
    const char **names;
  } languages;
  uint16_t binary_format_major_version;
  uint16_t binary_format_minor_version;
  uint64_t build_epoch;
  struct {
    size_t count;
    MMDB_description_s **descriptions;
  } description;
} MMDB_metadata_s;

typedef struct MMDB_ipv4_start_node_s {
  uint16_t netmask;
  uint32_t node_value;
} MMDB_ipv4_start_node_s;

typedef struct MMDB_s {
  uint32_t flags;
  const char *filename;
  ssize_t file_size;
  const uint8_t *file_content;
  const uint8_t *data_section;
  uint32_t data_section_size;
  const uint8_t *metadata_section;
  uint32_t metadata_section_size;
  uint16_t full_record_byte_size;
  uint16_t depth;
  MMDB_ipv4_start_node_s ipv4_start_node;
  MMDB_metadata_s metadata;
} MMDB_s;

typedef  char * pchar;

MMDB_lookup_result_s MMDB_lookup_string(MMDB_s *const mmdb,   const char *const ipstr, int *const gai_error,int *const mmdb_error);
int MMDB_open(const char *const filename, uint32_t flags, MMDB_s *const mmdb);
int MMDB_aget_value(MMDB_entry_s *const start,  MMDB_entry_data_s *const entry_data,  const char *const *const path);
char *MMDB_strerror(int error_code);

int MMDB_get_entry_data_list(MMDB_entry_s *start, MMDB_entry_data_list_s **const entry_data_list);
void MMDB_free_entry_data_list(MMDB_entry_data_list_s *const entry_data_list);
void MMDB_close(MMDB_s *const mmdb);
const char *gai_strerror(int errcode);
	cdef__index  
1.3.2_VERSIONCgc	caststringnewffirequire 