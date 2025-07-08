function [data, auxData, metaData, txtData, weights] = mydata_Chlidonias_hybrida
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Chlidonias_hybrida'; 
metaData.species_en = 'Whiskered tern'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tnffm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 20.5;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'values for Chlidonias_leucopterus';
data.tx = 20;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'PailLatr2008';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'AnAge';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for C. niger';
data.am = 21*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for C. niger';

data.Wwb = 13;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Harr1975';
  comment.Wwb = 'egg length 3.92 cm, width 2.85 cm, weight: pi/6*3.92*2.85^2=16.7 g';
data.Wwi = 100;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'arkive';
  comment.Wwi = '83 to 100 g';  

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Harr1975';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.067	14.839
0.065	12.250
0.064	10.368
0.949	22.380
0.951	20.027
0.952	18.615
0.953	16.733
0.953	15.321
1.913	20.274
1.938	26.156
1.939	24.274
1.941	21.686
1.943	17.686
2.895	35.579
2.925	33.933
2.950	40.992
2.951	39.345
2.952	37.698
2.955	32.286
2.956	30.874
2.957	29.227
2.960	24.286
3.941	42.180
3.942	39.827
3.943	37.709
3.945	35.592
3.976	32.063
3.977	29.239
4.904	40.073
4.928	49.721
4.929	47.603
4.930	46.191
4.931	44.544
4.936	35.603
4.937	33.015
4.961	42.192
5.916	55.379
5.917	53.262
5.920	47.850
5.921	45.732
6.904	60.568
6.905	58.450
6.907	55.391
6.909	52.097
6.970	46.921
6.984	72.098
7.949	67.639
7.950	66.227
7.951	64.345
7.952	62.462
7.953	61.286
7.954	58.933
7.956	55.168
8.881	70.003
8.882	68.591
8.945	59.886
8.965	76.357
8.967	72.592
9.875	65.308
9.924	80.838
9.926	76.838
9.928	73.544
9.930	70.015
9.932	67.897
10.888	77.085
10.890	73.320
10.892	70.026
10.893	68.615
10.912	86.262
10.913	83.909
10.914	82.262
11.906	81.097
11.910	75.450
11.963	84.157
11.989	89.569
12.851	60.402
12.893	89.109
12.894	87.462
12.933	69.580
12.946	98.050
13.910	95.003
13.913	90.297
13.915	86.297
13.917	82.532
13.922	74.062
14.898	100.662
14.916	69.838
14.934	89.133
14.937	83.956
15.884	109.379
15.904	75.262
15.926	86.556
15.929	83.027
15.980	95.027
15.981	92.674
16.912	95.979
16.920	82.568
16.926	72.450
16.945	89.392
17.897	106.815
17.967	86.580
17.969	83.286
17.972	78.815
18.861	104.238
18.891	101.885
18.900	86.591
18.981	97.416
19.936	109.662];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PailLatr2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

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
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '5XX6Q'; % Cat of Life
metaData.links.id_ITIS = '726051'; % ITIS
metaData.links.id_EoL = '45509331'; % Ency of Life
metaData.links.id_Wiki = 'Chlidonias_hybrida'; % Wikipedia
metaData.links.id_ADW = 'Chlidonias_hybrida'; % ADW
metaData.links.id_Taxo = '53841'; % Taxonomicon
metaData.links.id_WoRMS = '137135'; % WoRMS
metaData.links.id_avibase = '7AB4E42B260B5954'; % avibase
metaData.links.id_birdlife = 'whiskered-tern-chlidonias-hybrida'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlidonias_hybrida}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chlidonias_niger}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1065007/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.arkive.org/whiskered-tern/chlidonias-hybrida/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PailLatr2008'; type = 'Article'; bib = [ ... 
'author = {J.-M. Paillisson and F. Latraube and S. Reeber}, ' ... 
'year = {2008}, ' ...
'title = {Assessing growth and age of Whiskered Tern \emph{Chlidonias hybrida} chicks using biometrics}, ' ...
'journal = {Ardea}, ' ...
'volume = {96}, ' ...
'pages = {241-255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. Harrison}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of British and European birds}, ' ...
'publisher = {Collins, London}'];
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

