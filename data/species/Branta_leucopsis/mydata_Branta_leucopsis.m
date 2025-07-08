function [data, auxData, metaData, txtData, weights] = mydata_Branta_leucopsis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Branta_leucopsis'; 
metaData.species_en = 'Barnacle goose'; 

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'TH', 'MA'};
metaData.ecoCode.habitat = {'xiFm', 'biTht'};
metaData.ecoCode.embryo  = {'Tncf','Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 10 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 25;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24 to 26 d';
data.tx = 42;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'LoonOost1997';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'EoL: 40 till 45 d';
data.tp = 126;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28.2 * 365;  units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 104;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';        bibkey.Ww0 = 'avibase';
data.Wwb = 60;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'avibase';
data.Wwi = 1586; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'avibase';
  comment.Wwi = 'EoL: 1.21 to 2.23 kg';
data.Wwim = 1788; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'avibase';

data.Ri  = 4.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EoL';   
 temp.Ri = metaData.T_typical;    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
13.889	346.949
15.976	541.316
15.978	514.660
15.980	485.581
15.981	456.503
15.982	434.694
15.985	381.383
16.014	614.023
16.015	594.637
16.017	575.251
16.984	524.597
16.986	497.942
16.988	456.747
17.951	498.175
17.953	464.250
17.954	444.864
17.985	636.310
17.987	612.077
17.988	587.845
17.992	517.571
20.998	777.589
21.003	695.199
21.916	867.472
21.962	806.902
21.963	780.246
21.964	760.860
21.965	739.051
21.966	724.512
23.838	1018.180
23.927	933.388
23.929	882.500
23.933	812.226
23.934	797.687
23.936	771.031
23.979	749.232
26.813	1086.753
26.857	1050.414
26.936	1144.941
27.817	1145.154
27.865	1040.966
27.866	1019.156
27.988	1089.461
27.994	985.262
27.994	973.146
27.995	956.183
30.053	917.909
31.877	1327.883
31.879	1291.534
31.882	1233.377
31.929	1138.881
32.880	1391.131
32.882	1347.513
32.889	1228.774
33.894	1262.944
33.899	1180.554
33.901	1149.052
33.902	1124.819
37.871	1431.112
40.767	1402.735
40.847	1485.145
40.901	1271.911
40.940	1313.116
41.776	1383.593
41.899	1422.396]; 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LoonOost1997';

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced, weight data revised';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'N74C'; % Cat of Life
metaData.links.id_ITIS = '175014'; % ITIS
metaData.links.id_EoL = '45510541'; % Ency of Life
metaData.links.id_Wiki = 'Branta_leucopsis'; % Wikipedia
metaData.links.id_ADW = 'Branta_leucopsis'; % ADW
metaData.links.id_Taxo = '52028'; % Taxonomicon
metaData.links.id_WoRMS = '159177'; % WoRMS
metaData.links.id_avibase = '3163ED86A508BB83'; % avibase
metaData.links.id_birdlife = 'barnacle-goose-branta-leucopsis'; % birdlife
metaData.links.id_AnAge = 'Branta_leucopsis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Branta_leucopsis}}';
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
bibkey = 'LoonOost1997'; type = 'Article'; bib = [ ... 
'author = {M. U. E. Loonen and K. Oosterbeek and R. H. Drent}, ' ... 
'year = {1997}, ' ...
'title = {VARIATION IN GROWTH OF YOUNG AND ADULT SIZE IN BARNACLE GEESE \emph{Branta leucopsis}: EVIDENCE FOR DENSITY DEPENDENCE}, ' ...
'journal = {Ardea}, ' ...
'volume = {85}, ' ...
'pages = {177-192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Branta_leucopsis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1048436/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=3163ED86A508BB83&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

