function [data, auxData, metaData, txtData, weights] = mydata_Phocoenoides_dalli

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Phocoenidae';
metaData.species    = 'Phocoenoides_dalli'; 
metaData.species_en = 'Dall''s porpoise'; 

metaData.ecoCode.climate = {'ME', 'MC'};
metaData.ecoCode.ecozone = {'MPSW', 'MPSE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(37); % K, body temp

metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
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

data.tg = 347;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 302;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1826;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2375;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 22*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 107; units.Lb = 'cm'; label.Lb = 'length at birth';                    bibkey.Lb = 'KasuShir1985';
data.Lp = 171; units.Lp = 'cm'; label.Lp = 'length at puberty for females';      bibkey.Lp = 'KasuShir1985';
data.Lpm = 183; units.Lpm = 'cm'; label.Lpm = 'length at puberty for males';     bibkey.Lpm = 'KasuShir1985';
data.Li = 190; units.Li = 'cm'; label.Li = 'ultimate length for females';        bibkey.Li = 'KasuShir1985';
data.Lim = 191; units.Lim = 'cm'; label.Lim = 'ultimate length for males';       bibkey.Lim = 'KasuShir1985';

data.Wwi = 120e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'AnAge';  

data.Ri  = 0.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 1 litter per 0.7 yr';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), length (cm)
0.004	 90.231
0.850	136.923
2.017	152.781
3.018	162.959
4.068	167.692
5.022	175.976
6.022	188.521
7.025	188.047
8.004	188.047
9.031	190.414
10.034	187.574]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KasuShir1985';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.003	 92.864
1.012	140.662
2.041	152.211
3.046	166.128
4.002	170.580
5.004	172.663
6.009	182.556
6.989	189.847
8.088	194.528
9.043	200.400
10.045	196.093]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KasuShir1985';
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

%% Links
metaData.links.id_CoL = '4GK8K'; % Cat of Life
metaData.links.id_ITIS = '180480'; % ITIS
metaData.links.id_EoL = '46559358'; % Ency of Life
metaData.links.id_Wiki = 'Phocoenoides_dalli'; % Wikipedia
metaData.links.id_ADW = 'Phocoenoides_dalli'; % ADW
metaData.links.id_Taxo = '68806'; % Taxonomicon
metaData.links.id_WoRMS = '254987'; % WoRMS
metaData.links.id_MSW3 = '14300123'; % MSW3
metaData.links.id_AnAge = 'Phocoenoides_dalli'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phocoenoides_dalli}}';
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
bibkey = 'KasuShir1985'; type = 'article'; bib = [ ... 
'author = {T. Kasuya and S. Shiraga}, ' ... 
'year = {1985}, ' ...
'title = {Growth of {D}all''s porpoise in the wartern {N}orht {P}acific and suggested geographical growth differentiation}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {36}, ' ...
'pages = {139--152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phocoenoides_dalli}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Phocoenoides_dalli/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

