function [data, auxData, metaData, txtData, weights] = mydata_Phymaturus_antofagastensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Liolaemidae';
metaData.species    = 'Phymaturus_antofagastensis'; 
metaData.species_en = 'Lizard'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 04];              
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

data.ab = 90;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'BoreCabe2017';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'BoreCabe2017';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'BoreCabe2017';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess';  
  comment.Lb = 'based on Phymaturus_patagonicus';
data.Li  = 9.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'BoreCabe2017'; 
  comment.Li = 'based on tL data';
data.Lim  = 10;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = '416.5*(9.5/22.8)^3'; 
  comment.Lim = 'based on tL data';

data.Wwi = 30.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Basiliscus_basiliscus: 416.5*(9.5/22.8)^3';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'AnAge','BoreCabe2017'};   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per 2 yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
2.023	6.700
5.904	7.817
6.062	8.581
6.063	8.044
6.867	7.961
7.000	8.437
7.936	8.788
9.996	9.450
10.909	8.705
10.962	9.140
11.927	8.705
12.005	9.388
12.060	9.036
12.968	9.780
14.951	9.718];
data.tL_f(:,1) = (data.tL_f(:,1)+.8) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BoreCabe2017'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.070	4.832
0.071	4.941
0.072	5.049
1.955	5.483
1.956	6.822
4.154	7.690
7.155	8.703
8.935	8.956
9.005	9.209
10.716	9.463
11.798	9.282
11.937	9.589
14.974	9.680
15.812	9.987
19.616	10.023
20.000	10.059];
data.tL_m(:,1) = (data.tL_m(:,1)+0.8) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BoreCabe2017'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

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
metaData.links.id_CoL = '77H4K'; % Cat of Life
metaData.links.id_ITIS = '1056539'; % ITIS
metaData.links.id_EoL = '1055583'; % Ency of Life
metaData.links.id_Wiki = 'Phymaturus_antofagastensis'; % Wikipedia
metaData.links.id_ADW = 'Phymaturus_antofagastensis'; % ADW
metaData.links.id_Taxo = '643951'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'Phymaturus&species=antofagastensis'; % ReptileDB
metaData.links.id_AnAge = 'Phymaturus_antofagastensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phymaturus_antofagastensis}}';
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
bibkey = 'BoreCabe2017'; type = 'Article'; bib = [ ...
'doi = {10.1007/s00360-017-1136-z}, ' ...
'author = {Jorgelina M. Boretto and Facundo Cabezas‑Cartes and Nora R. Ibarg\"{u}engoytí}, ' ... 
'year = {2017}, ' ...
'title = {Slow life histories in lizards living in the highlands of the {A}ndes {M}ountains}, ' ...
'journal = {Journal of Comparative Physiology B}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Phymaturus_antofagastensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

