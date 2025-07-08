function [data, auxData, metaData, txtData, weights] = mydata_Glyptemys_insculpta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Glyptemys_insculpta'; 
metaData.species_en = 'Wood turtle'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 59;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'ADW';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '47 to 69 d';
data.tp = 13*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MarcHugh2018';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '12 to 14 yr';
data.am = 60*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.1;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';   bibkey.Lb  = 'MarcHugh2018'; 
data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'MarcHugh2018'; 
data.Li  = 22;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'guess';
data.Lim  = 25;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'MarcHugh2018';

data.Wwb = 4.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwim = 'based on size-corrected value for Actinemys marmorata: (3.1/16)^3*626';
data.Wwi = 1.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwim = 'based on size-corrected value for Actinemys marmorata: (22/16)^3*626';
data.Wwim = 2.4e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on size-corrected value for Actinemys marmorata: (25/16)^3*626';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 18 eggs per clutch, 1 clutch per yr';
 
% uni-variate data

% time-length data
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.023	3.161
0.770	4.310
1.787	5.690
2.743	6.839
3.821	8.046
4.807	8.793
5.794	9.598
6.780	10.632
7.797	11.839
8.783	12.759
9.769	13.793
10.847	14.540
11.772	15.000
12.789	15.920
13.744	16.092
14.792	16.839
15.716	17.644
16.703	18.621
17.812	18.563
18.737	19.195
19.723	19.655
20.801	20.402
21.787	20.805
22.804	19.943];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MarcHugh2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
0.247	3.276
1.233	4.598
2.219	5.690
3.205	6.839
4.253	8.046
5.177	8.966
6.194	9.828
7.242	11.092
8.166	12.356
9.153	13.678
10.231	14.540
11.156	15.690
12.265	16.494
13.128	17.299
14.237	18.103
15.223	18.678
16.240	20.000
17.257	20.230
18.182	21.207
19.230	21.782];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MarcHugh2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
data.psd.k = 0.6; units.psd.k  = '-';  label.psd.k = 'maintenance ratio';
weights.psd.k = 0.3;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low spec somatic maintenance, [p_M], maturity maintenance is released and maintenance ratio 0.6 is used as pseudo data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3GHJR'; % Cat of Life
metaData.links.id_ITIS = '668669'; % ITIS
metaData.links.id_EoL = '1056845'; % Ency of Life
metaData.links.id_Wiki = 'Glyptemys_insculpta'; % Wikipedia
metaData.links.id_ADW = 'Glyptemys_insculpta'; % ADW
metaData.links.id_Taxo = '640663'; % Taxonomicon
metaData.links.id_WoRMS = '1463691'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Glyptemys&species=insculpta'; % ReptileDB
metaData.links.id_AnAge = 'Glyptemys_insculpta'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glyptemys_insculpta}}';
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
bibkey = 'MarcHugh2018'; type = 'Article'; bib = [ ... 
'author = {Kelsey A. Marchand and Geoffrey N. Hughes and Jacqueline D. Litzgus}, ' ... 
'year = {2018}, ' ...
'title = {Geographic Variation in Somatic Growth Rate of Wood Turtles (\emph{Glyptemys insculpta})}, ' ...
'journal = {Copeia}, ' ...
'volume = {106}, ' ...
'number = {3}, ' ...
'pages = {477-484}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Glyptemys_insculpta/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Glyptemys_insculpta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

