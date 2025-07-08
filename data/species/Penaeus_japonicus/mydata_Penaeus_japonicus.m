  function [data, auxData, metaData, txtData, weights] = mydata_Penaeus_japonicus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Penaeidae';
metaData.species    = 'Penaeus_japonicus'; 
metaData.species_en = 'Kuruma shrimp'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE', 'MI', 'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author     = {'Dong Shipeng'};
metaData.date_subm  = [2022 5 12];
metaData.email      = {'dongshipeng@stu.ouc.edu.cn'};
metaData.address    = {'Ocean University of China'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data
data.ab = 2; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'SongWeng2004';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 70; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = {'SongWeng2004','NakaMats1992'};
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature';  
data.am = 2*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'SongWeng2004';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Li  = 27;   units.Li  = 'cm'; label.Li  = 'ultimate total length for female';   bibkey.Li  = 'Wiki';
data.Lim = 17; units.Lim = 'cm'; label.Lim = 'ultimate total length for males'; bibkey.Lim = 'Wiki';

data.Wwi = 130;     units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri = 1507; units.Ri = '#/d'; label.Ri = 'ultimate reproduction rate'; bibkey.Ri = {'ZhangKong2005','LinLi2006'};
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';  
  
% uni-variate data
% time-length data   Guzhenkou Bay
data.tL_f1 = [ ... % time since birth (d), carapace length (cm)
 59  8.38
 73 10.18
 74 10.88
 86 11.84
 87 11.79
101 12.81
102 12.71
115 13.82
116 13.28
129 14.86
131 13.94
143 15.33];
units.tL_f1   = {'d', 'cm'};  label.tL_f1 = {'time since birth', 'total length'};  
temp.tL_f1    = C2K(22);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Li2008';
comment.tL_f1 = 'data for females from Guzhenkou Bay in 2006 and 2007';

data.tL_m1 = [ ... % time since birth (d), carapace length (cm)
 59  8.62
 73 10.25
 74 10.69
 86 11.57
 87 11.48
101 12.58
102 12.52
115 13.47
116 13.25
129 14.13
131 13.57
143 14.56];
units.tL_m1   = {'d', 'cm'};  label.tL_m1 = {'time since birth', 'total length'};  
temp.tL_m1    = C2K(22);  units.temp.tL_m1 = 'K'; label.temp.tL_m1 = 'temperature';
bibkey.tL_m1 = 'Li2008';


% time-length data     Laoshan Bay
data.tL_f2 = [ ... % time since birth (d), carapace length (cm)
 55  8.60
 69 10.03
 83 11.66
 97 13.00
111 13.40
125 14.52
139 15.28];
units.tL_f2   = {'d', 'cm'};  label.tL_f2 = {'time since birth', 'total length'};  
temp.tL_f2    = C2K(22);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Fan2009';
comment.tL_f2 = 'data for females from Laoshan Bay in 2009';

data.tL_m2 = [ ... % time since birth (d), carapace length (cm)
 55  8.86
 69 10.53
 83 11.73
 97 12.78
111 13.52
125 14.34
139 15.06];
units.tL_m2   = {'d', 'cm'};  label.tL_m2 = {'time since birth', 'total length'};  
temp.tL_m2    = C2K(22);  units.temp.tL_m2 = 'K'; label.temp.tL_m2 = 'temperature';
bibkey.tL_m2 = 'Fan2009';

% time-length data    intensive ponds
data.tL_f3 = [ ... % time since birth (d), carapace length (cm)
 30 4.44
 40 5.19
 50 6.04
 60 6.76
 70 7.27
 80 7.67
 90 8.05
100 8.26
110 8.54
120 8.93
130 9.47];
units.tL_f3   = {'d', 'cm'};  label.tL_f3 = {'time since birth', 'carapace length'};  
temp.tL_f3    = C2K(22);  units.temp.tL_f3 = 'K'; label.temp.tL_f3 = 'temperature';
bibkey.tL_f3 = 'SunLi2011';

data.tW_f = [ ... % time since birth (d), wet weight (g)
 30 1.03
 40 1.64
 50 2.51
 60 3.67
 70 4.65
 80 5.50
 90 6.45
100 6.70
110 7.34
120 7.80
130 9.64];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight'};  
temp.tW_f    = C2K(22);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SunLi2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f1 = 5 * weights.tL_f1;
weights.tL_m1 = 3 * weights.tL_m1;

weights.tL_f2 = 5 * weights.tL_f2;
weights.tL_m2 = 3 * weights.tL_m2;

weights.tL_f3 = 5 * weights.tL_f3;
weights.tW_f = 3 * weights.tW_f;

weights.Li = 0 * weights.Li;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1','tL_m1'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_f2','tL_m2'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females, based on tL data, but at odds with Wiki';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '9XW6B'; % Cat of Life
metaData.links.id_ITIS = '551588';
metaData.links.id_EoL = '1022155'; % Ency of Life
metaData.links.id_Wiki = 'Marsupenaeus'; % Wikipedia
metaData.links.id_ADW = 'Marsupenaeus_japonicus'; % ADW
metaData.links.id_Taxo = '33817'; % Taxonomicon
metaData.links.id_WoRMS = '210371'; % WoRMS

%% References
%
bibkey = 'SongWeng2004'; type = 'book'; bib = [ ...
'author = {Song, S. and Weng, X.}, ' ... 
'title = {Healthy aquaculture technology of \emph{Penaeus japonicus}}, ' ... 
'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Marsupenaeus}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhangKong2005'; type = 'article'; bib = [ ...
'author = {Zhang, Q. and Kong, J. and Luan, S. and Liu, S. and Liu, L. and Wang, Y.}, ' ... 
'title = {The primary research on controlled breeding of \emph{Marsupenaeus japonicus} as broodstock}, ' ... 
'journal = {Marine Fisheries Research}, ' ... 
'year = {2005}, ' ... 
'volume = {26}, ' ... 
'pages = {14--18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'LinLi2006'; type = 'article'; bib = [ ...
'author = {Lin, Q. and Li, J. and Wang, G. and Huang, J. and Ai, C. and Chen, X. and Ye, H.}, ' ... 
'title = {Study on reproductive ecology of shrimp and crab broodstock}, ' ... 
'journal = {Journal of Xiamen University (Natural Science)}, ' ... 
'year = {2006}, ' ... 
'volume = {45}, ' ... 
'pages = {201--204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Li2008'; type = 'mastersthesis'; bib = [ ...
'author = {Li, X.}, ' ... 
'title = {The Preliminary Research on the Releasing of \emph{Penaeus japonicus} in {G}uzhenkou {B}ay}, ' ... 
'school = {Ocean University of China}, ' ... 
'year = {2008}, ' ... 
'address = {39p}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fan2009'; type = 'phdthesis'; bib = [ ...
'author = {Fan, Y.}, ' ... 
'title = {The Evalution on the Releasing of \emph{Penaeus japonicus} in {L}aoshan {B}ay and Primary Research on \emph{Paralichthys olivaceus} in {G}uzhenkou {B}ay}, ' ... 
'school = {Ocean University of China}, ' ... 
'year = {2009}, ' ... 
'address = {38p}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'SunLi2011'; type = 'article'; bib = [ ...
'author = {Sun, C. and Li, T. and Li, Y. and Wang, P. and Xu, A. and Sun, C.  and Li, Y.}, ' ... 
'title = {Growth pattern of kuruma shrimp \emph{Marsupenaeus japonicus} cultured in intensive ponds above sea level}, ' ... 
'journal = {Journal of Dalian Ocean University}, ' ... 
'year = {2011}, ' ... 
'volume = {26}, ' ... 
'pages = {316--321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'NakaMats1992'; type = 'article'; bib = [ ...
'author = {Nakamura, K. and Matsuzaki, N. and Yonekura, K.}, ' ... 
'title = {Organogenesis of genital organs and androgenic gland in the kuruma prawn \emph{Penaeus japonicus}}, ' ... 
'journal = {Nihon-suisan-gakkai-shi}, ' ... 
'year = {1992}, ' ... 
'volume = {58}, ' ... 
'pages = {2261--2267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
