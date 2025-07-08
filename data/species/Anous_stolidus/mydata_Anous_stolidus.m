function [data, auxData, metaData, txtData, weights] = mydata_Anous_stolidus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Anous_stolidus'; 
metaData.species_en = 'Brown noddy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'biMc'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 33;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'DorwAshm1963';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '32 to 35 d. Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care.';
data.tx = 47;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'DorwAshm1963';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 141;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Anous minutus';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Anous minutus';
  
data.Wwb = 23;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DorwAshm1963';
data.Wwi = 250;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DorwAshm1963';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DorwAshm1963';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.900	23.694
1.019	26.063
1.019	27.486
1.019	33.177
1.799	26.044
1.919	26.041
1.919	24.619
1.919	34.105
1.979	36.001
2.759	40.251
2.999	35.976
2.999	40.245
2.999	43.091
3.118	24.116
3.958	36.428
4.858	55.379
4.918	24.547
4.918	39.251
6.057	74.323
7.076	51.057
7.856	80.920
7.916	65.267
8.036	56.252
8.036	59.098
8.036	70.481
8.036	78.070
8.036	83.288
8.096	68.108
10.135	94.621
10.795	96.503
10.975	106.933
11.034	81.794
11.034	96.497
11.034	105.509
11.694	107.865
11.874	107.861
12.114	88.408
12.114	110.227
12.834	107.364
13.973	156.190
14.033	119.193
14.093	116.820
14.933	101.622
14.933	109.685
14.933	135.772
15.172	112.526
17.691	173.177
17.751	154.204
17.931	108.666
17.991	154.198
17.991	155.146
18.051	142.339
18.051	173.169
18.111	139.966
18.891	155.599
18.891	174.572
18.951	119.076
18.951	123.345
20.030	159.367
21.109	139.895
23.928	168.761
24.948	213.321
25.067	168.734
25.067	187.706
27.886	188.588
27.886	192.856
27.946	238.389
28.066	177.674
28.066	203.287
28.606	198.057
28.906	198.050
29.145	203.736
29.985	198.973
32.024	199.873
32.024	208.410
32.024	213.154
32.144	243.506
38.021	193.565
38.921	202.555
38.921	207.298
38.921	227.694
38.981	211.566
39.040	222.473
41.679	230.000
41.859	229.047
41.979	218.609
41.979	233.787
42.039	198.687
42.039	208.647
42.879	208.627
42.939	178.270
43.058	218.584
43.118	257.001
43.898	198.168
46.837	183.395];
n = size(data.tW,1);
for i = 2:n
  if data.tW(i,1) <= data.tW(i-1,1) % make sure that each time point is unique
    data.tW(i,1) = max(data.tW(i-1,1), data.tW(i,1)) + 1e-6;
  end
end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'DorwAshm1963';

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
D1 = 'Body temperature guessed; high age at first reproduction cannot be captured by the std model';
D2 = 'relative food intake decreases prior to fledging';
D3 = 'mod_1: v is reduced';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '66XV5'; % Cat of Life
metaData.links.id_ITIS = '176941'; % ITIS
metaData.links.id_EoL = '45509255'; % Ency of Life
metaData.links.id_Wiki = 'Anous_stolidus'; % Wikipedia
metaData.links.id_ADW = 'Anous_stolidus'; % ADW
metaData.links.id_Taxo = '53838'; % Taxonomicon
metaData.links.id_WoRMS = '212629'; % WoRMS
metaData.links.id_avibase = 'A070171E774B95B5'; % avibase
metaData.links.id_birdlife = 'brown-noddy-anous-stolidus'; % birdlife
metaData.links.id_AnAge = 'Anous_stolidus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anous_stolidus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anous_minutus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DorwAshm1963'; type = 'Article'; bib = [ ... 
'author = {D. F. Dorward andN. P. Ashmole}, ' ... 
'doi = {10.1111/j.1474-919X.1963.tb06765.x}, ' ...
'year = {1963}, ' ...
'title = {NOTES ON THE BIOLOGY OF THE BROWN NODDY \emph{Anous stolidus} ON {A}SCENSION {I}SLAND}, ' ...
'journal = {Ibis}, ' ...
'volume = {103B}, ' ...
'pages = {447-457}'];
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

