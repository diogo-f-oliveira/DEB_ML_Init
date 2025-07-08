function [data, auxData, metaData, txtData, weights] = mydata_Asio_flammeus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Asio_flammeus'; 
metaData.species_en = 'Short-eared owl'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 04];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 25;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 30;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ArroDeco2000';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AnAge';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 21.8*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 16;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwi = 406;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 178 to 435 g';

data.Ri  = 1.5*6/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 eggs per clutch, 15 clutches per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), ln wet weight (g)
0.967	17.464
1.933	25.780
5.943	95.634
7.947	139.709
8.019	103.950
8.914	155.509
8.950	168.815
9.952	141.372
11.992	213.721
11.993	220.374
12.958	222.037
12.959	230.353
14.032	223.701
14.033	239.501
14.964	279.418
15.036	230.353
15.967	232.848
16.038	258.628
16.969	258.628
17.971	313.514
17.972	324.324
18.902	311.019
18.974	283.576
19.905	297.713
19.976	322.661
20.943	286.902
20.944	299.376
20.979	356.757
21.945	320.166
21.946	328.482
21.981	353.430
22.983	316.840
22.984	331.809
23.986	334.304
23.987	346.778
24.952	338.462
24.953	346.778
25.955	342.620
25.956	350.104
25.957	360.083
26.885	342.620
26.993	355.094
27.959	335.135
28.926	346.778
28.927	384.200
29.964	345.114];  
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'ArroDeco2000';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), ln wet weight (g)
1.933	34.096
3.938	55.717
3.939	63.202
5.012	70.686
5.943	84.823
6.945	106.445
7.947	125.572
8.950	138.877
9.952	156.341
9.953	167.152
10.847	169.647
11.026	197.089
11.957	207.069
12.924	213.721
13.962	261.123
13.963	266.944
14.964	261.123
15.000	243.659
15.967	246.154
15.968	283.576
16.933	264.449
17.005	280.249
17.936	276.091
17.937	286.902
18.938	291.892
18.939	298.545
19.940	281.081
19.941	287.734
20.835	293.555
21.874	268.607
21.981	306.861
22.912	291.060
23.878	303.534
24.881	316.840];  
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'ArroDeco2000';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f; 
weights.tW_m = 2 * weights.tW_m; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '5W66M'; % Cat of Life
metaData.links.id_ITIS = '177935'; % ITIS
metaData.links.id_EoL = '45510754'; % Ency of Life
metaData.links.id_Wiki = 'Asio_flammeus'; % Wikipedia
metaData.links.id_ADW = 'Asio_flammeus'; % ADW
metaData.links.id_Taxo = '54765'; % Taxonomicon
metaData.links.id_WoRMS = '212685'; % WoRMS
metaData.links.id_avibase = '8F123A11E5DADFDD'; % avibase
metaData.links.id_birdlife = 'short-eared-owl-asio-flammeus'; % birdlife
metaData.links.id_AnAge = 'Asio_flammeus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Asio_flammeus}}';
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
bibkey = 'ArroDeco2000'; type = 'Article'; bib = [ ... 
'author = {B. E. Arroyo and T. Decornulier and V. Bretagnolle}, ' ... 
'year = {2000}, ' ...
'title = {SEX AND AGE DETERMINATION OF SHORT-EARED OWL NESTLINGS}, ' ...
'journal = {The Condor}, ' ...
'volume = {102}, ' ...
'pages = {216-219}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Asio_flammeus}}';
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

