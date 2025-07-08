function [data, auxData, metaData, txtData, weights] = mydata_Zalophus_californianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Zalophus_californianus'; 
metaData.species_en = 'California sea lion'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JXi'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 259;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp from ADW';
data.tx = 315;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature for males';
data.tpm = 1826;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 35.7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 64;   units.Lb  = 'cm';  label.Lb  = 'length at birth';                    bibkey.Lb  = 'KastScho2000';
data.Li  = 180;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';
data.Lim  = 240;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Wiki';
  
data.Wwb = 7e3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 25e3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 100e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 350e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';

data.Ri  = 1.2/730; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JXmf = 1.8e6/365; units.JXmf = 'g/d'; label.JXmf = 'ultimate food intake for females';  bibkey.JXmf = 'KastScho2000';
data.JXmm = 4e6/365;   units.JXmm = 'g/d'; label.JXmm = 'ultimate food intake for males';  bibkey.JXmm = 'KastScho2000';
  
% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.243	90.966
0.347	86.292
0.818	120.616
0.843	109.703
1.494	129.481
10.018	174.029
11.083	178.753
21.031	172.947
22.016	154.799];
data.tL_f(:,1) = data.tL_f(:,1) * 365.25; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f    = C2K(38.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KastScho2000';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.005	63.926
0.033	67.048
0.033	70.686
0.034	76.404
0.164	83.686
0.579	76.947
0.713	110.737
0.740	119.054
3.992	172.209
13.036	225.616
19.012	242.506];
data.tL_m(:,1) = data.tL_m(:,1) * 365.25; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m    = C2K(38.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KastScho2000';

% time - weight 
data.tW_f = [ ... % time since birth (yr), weight (kg)
0.106	5.673
0.186	11.343
0.344	15.106
0.739	23.566
0.923	23.537
1.528	33.858
1.529	40.487
5.027	72.132
6.080	89.958
10.074	107.320
13.091	89.798
21.018	71.502
22.096	79.854];
data.tW_f(:,1) = data.tW_f(:,1) * 365.25; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(38.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'KastScho2000';
% 
data.tW_m = [ ... % time since birth (yr), weight (kg)
0.106	5.673
0.106	7.567
0.107	12.302
0.240	22.698
0.606	12.223
0.738	18.831
0.741	36.823
2.006	67.873
2.011	100.070
3.981	102.600
4.008	109.224
5.050	222.696
6.063	146.779
7.016	197.765
13.059	389.993
19.033	308.557
19.127	402.293];
data.tW_m(:,1) = data.tW_m(:,1) * 365.25; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(38.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'KastScho2000';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1;set2};
metaData.grp.subtitle = {subtitle1; subtitle2};

%% Discussion points
D1 = 'Males are assumes to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '5CV54'; % Cat of Life
metaData.links.id_ITIS = '180621'; % ITIS
metaData.links.id_EoL = '46559212'; % Ency of Life
metaData.links.id_Wiki = 'Zalophus_californianus'; % Wikipedia
metaData.links.id_ADW = 'Zalophus_californianus'; % ADW
metaData.links.id_Taxo = '67414'; % Taxonomicon
metaData.links.id_WoRMS = '255003'; % WoRMS
metaData.links.id_MSW3 = '14001019'; % MSW3
metaData.links.id_AnAge = 'Zalophus_californianus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zalophus_californianus}}';
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
bibkey = 'KastScho2000'; type = 'Article'; bib = [ ... 
'author = {R. A. Kastelein and N. M. Schooneman and N. Vaughan and P. R. Wiepkema}, ' ... 
'year = {2000}, ' ...
'title = {Food Consumption and Growth of {C}alifornia Sea Lions (\emph{Zalophus californianus californianus})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {19}, ' ...
'pages = {143--159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Zalophus_californianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Zalophus_californianus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


