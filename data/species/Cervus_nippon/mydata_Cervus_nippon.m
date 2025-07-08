function [data, auxData, metaData, txtData, weights] = mydata_Cervus_nippon

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Cervus_nippon'; 
metaData.species_en = 'Sika deer'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 07 20];              
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

data.tg = 210;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '249-253 d';
data.tx = 172;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 500;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 26.3*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 5750;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 28590;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 50e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
data.Wwim = 109e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time  since birth (d),  weight (g)
13.654	3628.178
44.153	7472.807
75.675	13876.871
108.264	19001.516
138.755	23485.955
168.211	26477.299
194.516	28614.981
228.217	28834.619
258.747	29906.746
290.319	32045.413
319.787	33970.411
349.232	37814.841
379.755	39526.777
409.206	42944.664
441.833	44870.264
471.293	47435.076
502.875	48720.668
532.350	50005.861
560.802	48731.620
593.444	49377.602
622.932	49596.449
651.364	50028.363
683.996	51527.425
713.476	52386.081
742.949	53884.541
775.581	55383.604
805.064	56028.989
835.582	58167.462
866.120	58599.774
894.540	60098.040
926.139	59890.743
957.738	59683.445
990.388	59689.618
1020.924	60335.202
1050.396	61833.667
1079.899	60772.891
1111.488	61418.674]; 
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'weight', 'female'};  
temp.tWw_f  = C2K(38.6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'UchiIked2001';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time  since birth (d),  weight (g)
12.594	4267.787
45.186	9179.157
75.652	15796.298
105.077	21346.879
134.503	26897.470
165.013	29675.747
197.636	32027.890
227.123	32246.732
258.703	33745.595
288.153	37163.483
319.717	39941.964
349.160	43999.665
381.769	47418.150
410.156	51688.923
437.495	55532.955
470.118	57885.093
499.593	59170.287
530.124	60242.408
559.626	59181.637
592.276	59187.810
622.809	60046.665
651.234	61118.388
683.864	62830.717
715.440	64542.847
742.796	66893.994
774.381	67966.315
806.995	70958.262
837.521	72456.926
867.004	73102.310
896.474	74814.042
927.012	75246.357
958.619	74399.250
989.170	73765.218
1017.607	73770.595
1048.133	75269.256
1079.662	81033.512
1112.277	84025.459]; 
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'weight', 'male'};  
temp.tWw_m  = C2K(38.6);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'UchiIked2001';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 2 * weights.tWw_f;
weights.tWw_m = 2 * weights.tWw_m;
weights.Wwb = 5 * weights.Wwb;
weights.tg = 5 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'T56N'; % Cat of Life
metaData.links.id_ITIS = '180696'; % ITIS
metaData.links.id_EoL = '328650'; % Ency of Life
metaData.links.id_Wiki = 'Cervus_nippon'; % Wikipedia
metaData.links.id_ADW = 'Cervus_nippon'; % ADW
metaData.links.id_Taxo = '68001'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200371'; % MSW3
metaData.links.id_AnAge = 'Cervus_nippon'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cervus_nippon}}';
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
bibkey = 'UchiIked2001'; type = 'Article'; bib = [ ... 
'author = {Hiroshi Uchida and Shoshichi Ikeda and Mitsuharu Ishida and Tatsushi Inoue and Takeo Takeda}, ' ... 
'year = {2001}, ' ...
'title = {Growth Characteristics of Artificially Reared Sika Deer (\emph{Cervus nippon})}, ' ...
'journal = {Anim. Sci. J.}, ' ...
'volume = {72(6)}, ' ...
'pages = {461-466}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cervus_nippon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

