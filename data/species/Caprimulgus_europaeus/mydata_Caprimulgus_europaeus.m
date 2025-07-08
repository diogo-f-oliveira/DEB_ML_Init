function [data, auxData, metaData, txtData, weights] = mydata_Caprimulgus_europaeus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Caprimulgiformes'; 
metaData.family     = 'Caprimulgidae';
metaData.species    = 'Caprimulgus_europaeus'; 
metaData.species_en = 'European nightjar'; 

metaData.ecoCode.climate = {'BSh','BWk','Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17-21 d';
data.tx = 16.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-17 d';
data.tp = 49.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '16-17 d';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Ww0 = 8.5;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'Wiki';
data.Wwb = 6.5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BerrBibb1981';
data.Wwi = 67; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
 comment.Wwi = 'Wiki: female 67-95 g, male 51-101 g';

data.Ri  = 2*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Popl2014';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
1.000	7.283
1.001	6.087
1.002	11.087
1.003	10.109
1.007	5.109
1.197	7.174
1.265	6.304
2.002	7.283
2.011	11.848
2.015	10.543
2.018	9.239
2.024	14.891
2.043	15.761
2.064	8.370
2.236	9.239
2.834	13.152
2.988	20.109
2.993	18.370
2.995	10.109
3.005	14.348
3.073	13.261
3.162	20.109
3.167	18.370
3.247	13.261
3.975	24.891
3.984	22.065
3.995	18.152
3.998	17.283
4.003	15.435
4.051	14.022
4.136	14.457
4.157	22.283
4.984	22.283
5.001	24.130
5.016	18.696
5.029	29.239
5.033	28.152
5.219	24.022
5.246	22.174
5.822	25.978
5.981	24.022
5.987	29.239
6.001	31.957
6.015	34.674
6.017	26.522
6.020	33.043
6.021	25.543
6.172	25.652
6.975	34.022
6.999	33.043
7.001	39.891
7.011	28.804
7.023	32.174
7.029	37.935
7.030	37.500
7.159	37.935
7.937	39.891
7.974	42.174
7.976	34.022
7.987	30.109
7.990	44.022
7.991	36.196
7.994	35.217
8.164	44.022
8.176	40.109
8.970	44.022
8.976	41.848
8.979	48.478
9.004	39.891
9.030	45.761
9.043	33.913
9.117	45.978
9.129	41.848
9.970	52.065
9.971	44.022
10.005	39.891
10.019	42.391
10.028	46.957
10.044	48.804
10.047	47.935
10.145	44.130
10.986	46.848
10.987	53.913
10.989	45.761
11.000	49.674
11.005	47.935
11.150	50.217
11.156	48.152
11.963	55.217
12.002	56.739
12.004	55.978
12.012	45.870
12.030	47.065
12.043	50.000
12.909	51.739
12.928	52.826
12.956	57.935
12.974	44.239
12.984	55.761
13.126	52.065
13.152	58.043
13.923	55.000
13.931	59.674
13.950	52.935
13.963	55.978
13.981	50.000
14.167	53.152
14.176	50.217
14.928	60.978
14.946	54.891
14.959	58.043
14.961	57.065
15.089	58.043
15.142	54.891
15.928	53.913
15.933	59.674
15.936	58.913
15.942	56.739
15.953	53.043
15.956	51.848
16.023	58.913
16.933	60.217
16.989	55.978
17.054	56.196
17.933	60.761
17.968	55.978];
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(39.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BerrBibb1981';

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'QSND'; % Cat of Life
metaData.links.id_ITIS = '555569'; % ITIS
metaData.links.id_EoL = '45513604'; % Ency of Life 
metaData.links.id_Wiki = 'Caprimulgus_europaeus'; % Wikipedia
metaData.links.id_ADW = 'Caprimulgus_europaeus'; % ADW
metaData.links.id_Taxo = '54816'; % Taxonomicon
metaData.links.id_WoRMS = '1534762'; % WoRMS
metaData.links.id_avibase = '80D4B0FE7FF1D735'; % avibase
metaData.links.id_birdlife = 'european-nightjar-caprimulgus-europaeus'; % birdlife
metaData.links.id_AnAge = 'Caprimulgus_europaeus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caprimulgus_europaeus}}';
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
bibkey = 'BerrBibb1981'; type = 'Article'; bib = [ ... 
'author = {Rob Berry and Colin J. Bibby}, ' ... 
'year = {1981}, ' ...
'title = {A breeding study of nightjars}, ' ...
'journal = {Britisg Birds}, ' ...
'volume = {74(4)}, ' ...
'pages = {161-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=80D4B0FE7FF1D735&sec=lifehistory}}';
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

