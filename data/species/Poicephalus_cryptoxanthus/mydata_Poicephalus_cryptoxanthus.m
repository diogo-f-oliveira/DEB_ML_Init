function [data, auxData, metaData, txtData, weights] = mydata_Poicephalus_cryptoxanthus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Poicephalus_cryptoxanthus'; 
metaData.species_en = 'Brown-headed parrot'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 31;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for P. robustes';
data.tx = 66;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'TaylPerr2008';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 198;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 32.1*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 6.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TaylPerr2008';
data.Wwi = 160;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri = 3/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for P. robustes';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.435	5.705
2.469	7.134
3.503	8.849
4.457	8.853
5.412	10.282
6.447	12.281
7.483	15.990
8.358	17.988
9.632	20.559
10.510	24.836
11.387	28.829
12.582	32.253
13.379	35.391
14.419	44.228
15.373	44.517
16.568	48.227
17.528	56.493
18.483	58.207
19.360	61.630
20.715	66.480
21.597	76.456
22.313	77.314
23.430	83.302
24.626	87.581
25.501	88.725
26.457	92.433
27.494	96.997
28.611	101.845
29.569	108.403
30.526	112.111
31.634	106.703
32.516	116.394
33.710	118.679
34.428	122.101
35.537	118.117
36.650	118.693
37.446	119.266
38.481	121.835
39.595	124.405
40.628	123.555
41.422	122.419
42.453	120.714
43.728	124.424
44.605	128.132
45.480	129.276
46.509	123.583
47.546	128.716
48.578	127.296
49.611	127.301
50.644	126.736
51.595	124.177
52.626	120.763
53.501	121.906
54.612	120.202
55.487	121.631
56.442	123.060
57.393	119.931
58.582	116.517
59.698	119.942
60.411	117.666
61.522	115.677
62.557	117.391
63.354	120.529
65.495	115.126
66.773	122.824];
data.tW(:,1) = data.tW(:,1) - 1; % set origin to hatch
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'TaylPerr2008';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4KWLW'; % Cat of Life
metaData.links.id_ITIS = '177611'; % ITIS
metaData.links.id_EoL = '45514198'; % Ency of Life
metaData.links.id_Wiki = 'Poicephalus_cryptoxanthus'; % Wikipedia
metaData.links.id_ADW = 'Poicephalus_cryptoxanthus'; % ADW
metaData.links.id_Taxo = '70666'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4A03982169A8494D'; % avibase
metaData.links.id_birdlife = 'brown-headed-parrot-poicephalus-cryptoxanthus'; % birdlife
metaData.links.id_AnAge = 'Poicephalus_cryptoxanthus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Poicephalus_cryptoxanthus}}';
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
bibkey = 'TaylPerr2008'; type = 'Article'; bib = [ ... 
'doi = {10.2989/OSTRICH.2008.79.1.10.377}, ' ...
'author = {S. Taylor and M. R Perrin}, ' ... 
'year = {2008}, ' ...
'title = {Application of Richards''s growth model to Brown-headed Parrot \emph{Poicephalus cryptoxanthus} nestlings}, ' ...
'journal = {Ostrich}, ' ...
'volume = {79}, ' ...
'pages = {79-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Poicephalus_cryptoxanthus}}';
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

