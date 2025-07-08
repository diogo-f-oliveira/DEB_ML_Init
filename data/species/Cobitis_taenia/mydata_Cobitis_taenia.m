  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_taenia

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_taenia'; 
metaData.species_en = 'Spined loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.tp = 2.5*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'Robo1981';
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';   bibkey.tpm = 'Robo1981';
  temp.tpm = C2K(16); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Robo1981';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.5;  units.Lb = 'cm'; label.Lb = 'total length at birth';              bibkey.Lb = 'Robo1981'; 
data.Lp = 6;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Robo1981'; 
  comment.Lp = 'From tL-data at 2.5 yr';
data.Lpm = 4;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Robo1981'; 
data.Li = 13.5;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Robo1981';
  comment.Wwb = 'Based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwp = 1;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Robo1981';
  comment.Wwp = 'Based on (Lp/6.94)^3*6.94 from tL_1972 and tW_1972 at 3.5 yr';
data.Wwpm = 0.31;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';bibkey.Wwpm = 'Robo1981';
  comment.Wwpm = 'Based on (Lpm/6.94)^3*6.94 from tL_1972 and tW_1972 at 3.5 yr';
data.Wwi = 12; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'Robo1981';
  comment.Wwi = 'Based on (Li/6.94)^3*6.94 from tL_1972 and tW_1972 at 3.5 yr';

data.Ri = 1e3/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f1970 = [ ... % time since birth (yr), total length (cm)
0.5	3.076
1.5	4.488
2.5	5.850
3.5	6.806
4.5	6.897];
data.tL_f1970(:,1) = (.5 + data.tL_f1970(:,1)) * 365; % convert yr to d
units.tL_f1970 = {'d', 'cm'}; label.tL_f1970 = {'time since birth', 'total length', 'female'};  
temp.tL_f1970 = C2K(16);  units.temp.tL_f1970 = 'K'; label.temp.tL_f1970 = 'temperature';
bibkey.tL_f1970 = 'Robo1981';
comment.tL_f1970 = 'Data for females of the 1970 cohort';
%
data.tL_m1970 = [ ... % time since birth (yr), total length (cm)
0.5	2.898
1.5	3.879
2.5	4.326
3.5	5.345];
data.tL_m1970(:,1) = (.5 + data.tL_m1970(:,1)) * 365; % convert yr to d
units.tL_m1970 = {'d', 'cm'}; label.tL_m1970 = {'time since birth', 'total length', 'male'};  
temp.tL_m1970 = C2K(16);  units.temp.tL_m1970 = 'K'; label.temp.tL_m1970 = 'temperature';
bibkey.tL_m1970 = 'Robo1981';
comment.tL_m1970 = 'Data for males of the 1970 cohort';
%
data.tL_f1971 = [ ... % time since birth (yr), total length (cm)
0.5	3.292
1.5	4.806
2.5	6.003
3.5	6.552];
data.tL_f1971(:,1) = (.5 + data.tL_f1971(:,1)) * 365; % convert yr to d
units.tL_f1971 = {'d', 'cm'}; label.tL_f1971 = {'time since birth', 'total length', 'female'};  
temp.tL_f1971 = C2K(16);  units.temp.tL_f1971 = 'K'; label.temp.tL_f1971 = 'temperature';
bibkey.tL_f1971 = 'Robo1981';
comment.tL_f1971 = 'Data for females of the 1971 cohort';
%
data.tL_m1971 = [ ... % time since birth (yr), total length (cm)
0.5	3.457
1.5	4.488
2.5	5.088
3.5	5.459];
data.tL_m1971(:,1) = (.5 + data.tL_m1971(:,1)) * 365; % convert yr to d
units.tL_m1971 = {'d', 'cm'}; label.tL_m1971 = {'time since birth', 'total length', 'male'};  
temp.tL_m1971 = C2K(16);  units.temp.tL_m1971 = 'K'; label.temp.tL_m1971 = 'temperature';
bibkey.tL_m1971 = 'Robo1981';
comment.tL_m1971 = 'Data for males of the 1971 cohort';
%
data.tL_f1972 = [ ... % time since birth (yr), total length (cm)
0.5	3.129
1.5	4.386
2.5	6.197
3.5	6.940];
data.tL_f1972(:,1) = (.5 + data.tL_f1972(:,1)) * 365; % convert yr to d
units.tL_f1972 = {'d', 'cm'}; label.tL_f1972 = {'time since birth', 'total length', 'female'};  
temp.tL_f1972 = C2K(16);  units.temp.tL_f1972 = 'K'; label.temp.tL_f1972 = 'temperature';
bibkey.tL_f1972 = 'Robo1981';
comment.tL_f1972 = 'Data for females of the 1972 cohort';
%
data.tL_m1972 = [ ... % time since birth (yr), total length (cm)
0.5	3.346
1.5	4.670
2.5	5.562];
data.tL_m1972(:,1) = (.5 + data.tL_m1972(:,1)) * 365; % convert yr to d
units.tL_m1972 = {'d', 'cm'}; label.tL_m1972 = {'time since birth', 'total length', 'male'};  
temp.tL_m1972 = C2K(16);  units.temp.tL_m1972 = 'K'; label.temp.tL_m1972 = 'temperature';
bibkey.tL_m1972 = 'Robo1981';
comment.tL_m1972 = 'Data for males of the 1973 cohort';
%
data.tL_f1973 = [ ... % time since birth (yr), total length (cm)
0.5	2.927
1.5	5.062
2.5	6.400
3.5	7.156
4.5	7.792];
data.tL_f1973(:,1) = (.5 + data.tL_f1973(:,1)) * 365; % convert yr to d
units.tL_f1973 = {'d', 'cm'}; label.tL_f1973 = {'time since birth', 'total length', 'female'};  
temp.tL_f1973 = C2K(16);  units.temp.tL_f1973 = 'K'; label.temp.tL_f1973 = 'temperature';
bibkey.tL_f1973 = 'Robo1981';
comment.tL_f1973 = 'Data for females of the 1973 cohort';
%
data.tL_m1973 = [ ... % time since birth (yr), total length (cm)
0.5	2.764
1.5	4.886
2.5	5.251
3.5	5.616];
data.tL_m1973(:,1) = (.5 + data.tL_m1973(:,1)) * 365; % convert yr to d
units.tL_m1973 = {'d', 'cm'}; label.tL_m1973 = {'time since birth', 'total length', 'male'};  
temp.tL_m1973 = C2K(16);  units.temp.tL_m1973 = 'K'; label.temp.tL_m1973 = 'temperature';
bibkey.tL_m1973 = 'Robo1981';
comment.tL_m1973 = 'Data for males of the 1973 cohort';


% time-weight
data.tW_f1972 = [ ... % time since birth (yr), wet weight (g)
0.5	0.199
1.5	0.455
2.5	1.061
3.5	1.640];
data.tW_f1972(:,1) = (.5 + data.tW_f1972(:,1)) * 365; % convert yr to d
units.tW_f1972 = {'d', 'g'}; label.tW_f1972 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f1972 = C2K(16);  units.temp.tW_f1972 = 'K'; label.temp.tW_f1972 = 'temperature';
bibkey.tW_f1972 = 'Robo1981';
comment.tW_f1972 = 'Data for females of the 1972 cohort';
%
data.tW_m1972 = [ ... % time since birth (yr), wet weight (g)
0.5	0.163
1.5	0.527
2.5	0.766];
data.tW_m1972(:,1) = (.5 + data.tW_m1972(:,1)) * 365; % convert yr to d
units.tW_m1972 = {'d', 'g'}; label.tW_m1972 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m1972 = C2K(16);  units.temp.tW_m1972 = 'K'; label.temp.tW_m1972 = 'temperature';
bibkey.tW_m1972 = 'Robo1981';
comment.tW_m1972 = 'Data for males of the 1973 cohort';
%
data.tW_f1973 = [ ... % time since birth (yr), wet weight (g)
0.5	0.073
1.5	0.608
2.5	1.088
3.5	1.682];
data.tW_f1973(:,1) = (.5 + data.tW_f1973(:,1)) * 365; % convert yr to d
units.tW_f1973 = {'d', 'g'}; label.tW_f1973 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f1973 = C2K(16);  units.temp.tW_f1973 = 'K'; label.temp.tW_f1973 = 'temperature';
bibkey.tW_f1973 = 'Robo1981';
comment.tW_f1973 = 'Data for females of the 1973 cohort';
%
data.tW_m1973 = [ ... % time since birth (yr), wet weight (g)
0.5	0.121
1.5	0.572
2.5	0.802
3.5	1.032];
data.tW_m1973(:,1) = (.5 + data.tW_m1973(:,1)) * 365; % convert yr to d
units.tW_m1973 = {'d', 'g'}; label.tW_m1973 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m1973 = C2K(16);  units.temp.tW_m1973 = 'K'; label.temp.tW_m1973 = 'temperature';
bibkey.tW_m1973 = 'Robo1981';
comment.tW_m1973 = 'Data for males of the 1973 cohort';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1970', 'tL_m1970'}; subtitle1 = {'Data for 1970-cohort females, males'};
set2 = {'tL_f1971', 'tL_m1971'}; subtitle2 = {'Data for 1971-cohort females, males'};
set3 = {'tL_f1972', 'tL_m1972'}; subtitle3 = {'Data for 1972-cohort females, males'};
set4 = {'tL_f1973', 'tL_m1973'}; subtitle4 = {'Data for 1973-cohort females, males'};
set5 = {'tW_f1972', 'tW_m1972'}; subtitle5 = {'Data for 1972-cohort females, males'};
set6 = {'tW_f1973', 'tW_m1973'}; subtitle6 = {'Data for 1973-cohort females, males'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'WK47'; % Cat of Life
metaData.links.id_ITIS = '163981'; % ITIS
metaData.links.id_EoL = '212556'; % Ency of Life
metaData.links.id_Wiki = 'Cobitis_taenia'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_taenia'; % ADW
metaData.links.id_Taxo = '43977'; % Taxonomicon
metaData.links.id_WoRMS = '154373'; % WoRMS
metaData.links.id_fishbase = 'Cobitis-taenia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis_taenia}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
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
bibkey = 'Robo1981'; type = 'Article'; bib = [ ...  
'author = {P. W. J. Robotham}, ' ...
'year = {1981}, ' ...
'title = {Age, growth and reproduction of a population of spined loach, \emph{Cobitis taenia} ({L}.)}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {85}, '...
'pages = {129--136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/6378}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
