function [data, auxData, metaData, txtData, weights] = mydata_Berardius_bairdii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Ziphiidae';
metaData.species    = 'Berardius_bairdii'; 
metaData.species_en = 'Baird''s beaked whale'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2018 07 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 17*30.5;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'Kasu1977';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp taken from Monodon';
data.tx = 3*365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on 1 calf each 3 yr';
data.tp = 4383;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7.9*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 84*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 460; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'Kasu1977';
data.Lp = 1020; units.Lp = 'cm';   label.Lp = 'length at puberty for females'; bibkey.Lp = 'Kasu1977';
  comment.Lp = '10.1 till 10.4 m';
data.Lpm = 980; units.Lpm = 'cm'; label.Lpm = 'ultimate length for males'; bibkey.Lpm = 'Kasu1977';
  comment.Lpm = '7.8 till 10.1 m';
data.Li = 1098; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'Kasu1977';
data.Lim = 1068; units.Lim = 'cm'; label.Lim = 'ultimate length for males'; bibkey.Lim = 'Kasu1977';

data.Wwb = 922e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
  comment.Wwb = 'based on (Lb/Lim)^3 *Wwim';
data.Wwim = 11.38e6; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight'; bibkey.Wwim = 'AnAge';
  
data.Ri  = 1/365/3;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), length (cm)
1.835	638.437
16.591	1047.391
25.006	1140.646
36.022	1039.150
38.852	1099.018]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(35.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Kasu1977';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
2.347	777.937
17.121	1060.692
21.112	1069.674
26.075	1109.684
30.071	1081.028
40.098	1072.489
41.088	977.317
47.104	1090.423
49.856	1079.440
56.957	1058.631
58.029	1008.850
65.032	1046.709
67.247	1071.134
71.239	1070.153]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(35.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Kasu1977';
comment.tL_m = 'Data for males';

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'LJDV'; % Cat of Life
metaData.links.id_ITIS = '180496'; % ITIS
metaData.links.id_EoL = '46559395'; % Ency of Life
metaData.links.id_Wiki = 'Berardius_bairdii'; % Wikipedia
metaData.links.id_ADW = 'Berardius_bairdii'; % ADW
metaData.links.id_Taxo = '68825'; % Taxonomicon
metaData.links.id_WoRMS = '242608'; % WoRMS
metaData.links.id_MSW3 = '14300149'; % MSW3
metaData.links.id_AnAge = 'Berardius_bairdii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Berardius_bairdii}}';
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
bibkey = 'Kasu1977'; type = 'journal'; bib = [ ... 
'author = {T. Kasuya}, ' ... 
'year = {1977}, ' ...
'title = {Age determination and growth of the {B}aird''s beaked whale with a comment on the fetal growth rate}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {29}, ' ...
'pages = {1--20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Berardius_bairdii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Berardius_bairdii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

