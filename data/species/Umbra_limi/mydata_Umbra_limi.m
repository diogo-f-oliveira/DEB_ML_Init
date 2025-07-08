  function [data, auxData, metaData, txtData, weights] = mydata_Umbra_limi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Umbridae';
metaData.species    = 'Umbra_limi'; 
metaData.species_en = 'Central mudminnow'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 02]; 

%% set data
% zero-variate data
data.ab = 7;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'WallYeag1990'; 
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3 degrees C is actually temperature upon spawning';
data.tp = 1*365;  units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'WallYeag1990';
  temp.tp = C2K(13);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp is guessed';
data.am = 5*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'RobiJirk2010';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.6;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'WallYeag1990'; 
  comment.Lp =  '23 till 20 inches';
data.Li = 14;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*.15^3';
data.Wwi = 14.65; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.00389 *Li^3.12, see F1';
  
data.Ri = 1500/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed';
    
% uni-variate data
% time - length
data.tL_FBL = [ ... ; % time since birth (yr) total length (cm)
0.5	4.130
1.5	5.507
2.5	7.464
3.5	8.623
4.5	9.022
5.5	9.420
6.5	10.000];
data.tL_FBL(:,1) = (0.75 + data.tL_FBL(:,1)) * 365; % convert year to d
units.tL_FBL = {'d', 'cm'}; label.tL_FBL = {'time since birth', 'total length', 'First Bisby Lake'}; 
temp.tL_FBL = C2K(13); units.temp.tL_FBL = 'K'; label.temp.tL_FBL = 'temperature';
bibkey.tL_FBL = {'RobiJirk2010'};
comment.tL_FBL = 'Data from First Bisby Lake';
%
data.tL_LMO = [ ... % time since birth (yr) total length (cm)
0.5	4.312
1.5	5.652
2.5	6.812
3.5	6.775
4.5	7.029
5.5	8.188];
data.tL_LMO(:,1) = (0.75 + data.tL_LMO(:,1)) * 365;  % convert year to d 
units.tL_LMO = {'d', 'cm'}; label.tL_LMO = {'time since birth', 'total length', 'Little Moose Lake Outlet'};
temp.tL_LMO = C2K(13); units.temp.tL_LMO = 'K'; label.temp.tL_LMO = 'temperature';
bibkey.tL_LMO = {'RobiJirk2010'};
comment.tL_LMO = 'Data from Little Moose Lake Outlet';

% time - weight
data.tWw_FBL = [ ... % time since birth (yr) wet weight (g)
0.5	0.736
1.5	1.603
2.5	4.462
3.5	6.325
4.5	8.881
5.5	8.404
6.5	12.087];
data.tWw_FBL(:,1) = (0.75 + data.tWw_FBL(:,1)) * 365; % convert year to d
units.tWw_FBL = {'d', 'g'}; label.tWw_FBL = {'time since birth', 'wet weight', 'First Bisby Lake'}; 
temp.tWw_FBL = C2K(25); units.temp.tWw_FBL = 'K'; label.temp.tWw_FBL = 'temperature';
bibkey.tWw_FBL = {'RobiJirk2010'};
comment.tWw_FBL = 'Data from First Bisby Lake';
%
data.tWw_LMO = [ ... % time since birth (yr) wet weight (g)
0.5	0.780
1.5	1.906
2.5	2.946
3.5	3.032
4.5	3.596
5.5	5.199];
data.tWw_LMO(:,1) = (0.75 + data.tWw_LMO(:,1)) * 365;  % convert year to d
units.tWw_LMO = {'d', 'g'}; label.tWw_LMO = {'time since birth', 'wet weight', 'Little Moose Lake Outlet'}; 
temp.tWw_LMO = C2K(25); units.temp.tWw_LMO = 'K'; label.temp.tWw_LMO = 'temperature';
bibkey.tWw_LMO = {'RobiJirk2010'};
comment.tWw_LMO = 'Data from Little Moose Lake Outlet';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
3.199	0.295
3.715	0.504
3.827	0.496
3.878	0.598
3.895	0.696
3.898	0.398
3.915	0.496
3.995	0.613
3.996	0.500
4.068	0.608
4.114	0.702
4.190	0.702
4.200	0.587
4.267	0.714
4.285	0.804
4.374	0.804
4.395	0.684
4.474	0.906
4.485	0.804
4.577	0.906
4.695	0.791
4.704	0.994
4.889	1.110
4.889	1.003
4.977	1.293
4.991	1.003
5.002	1.092
5.070	1.198
5.665	1.832
5.769	1.879
5.783	1.771
5.874	2.045
5.916	1.879
5.968	2.171
5.983	1.994
6.023	2.134
6.091	2.323
6.107	2.028
6.147	2.444
6.203	2.550
6.204	2.134
6.246	2.284
6.246	2.246
6.288	2.661
6.330	2.776
6.389	2.529
6.390	2.383
6.390	2.284
6.447	2.824
6.505	3.074
6.507	2.616
6.535	2.971
6.596	2.684
6.596	2.550
6.670	3.262
6.670	3.127
6.702	2.572
6.703	2.486
6.731	3.048
6.732	2.848
6.794	2.872
6.808	3.153
6.810	2.572
6.839	3.290
6.853	3.833
6.902	3.048
6.931	3.932
6.933	3.346
6.965	3.318
6.997	3.074
7.141	3.432
7.222	3.737
7.253	4.581
7.307	3.127
7.353	4.208
7.386	4.739
7.389	3.581
7.454	4.465
7.473	3.833
7.491	3.375
7.524	3.965
7.641	5.568
7.641	5.474
7.642	4.820
7.856	4.353
7.924	6.010
7.925	5.337
7.943	5.521
7.963	4.659
8.035	5.115
8.069	6.270
8.126	5.615
8.218	6.010
8.219	5.568
8.295	5.202
8.331	6.061
8.350	5.859
8.368	6.654
8.368	6.378
8.676	8.368
8.836	8.227
9.040	7.818
9.396	8.439
9.436	10.345
9.634	8.511
9.919	12.259];
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'}; 
bibkey.LWw = {'RobiJirk2010'};
    
%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_FBL','tL_LMO'}; subtitle1 = {'Data from First Bisby Lake, Little Moose Lake Outlet'};
set2 = {'tWw_FBL','tWw_LMO'}; subtitle2 = {'Data from First Bisby Lake, Little Moose Lake Outlet'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Data tL and tW concern means of females and smaller males';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts 
F1 = 'length-weight: Ww in g = 0.00389 *(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DGKQ'; % Cat of Life
metaData.links.id_ITIS = '162153'; % ITIS
metaData.links.id_EoL = '216793'; % Ency of Life
metaData.links.id_Wiki = 'Umbra_limi'; % Wikipedia
metaData.links.id_ADW = 'Umbra_limi'; % ADW
metaData.links.id_Taxo = '42903'; % Taxonomicon
metaData.links.id_WoRMS = '1022375'; % WoRMS
metaData.links.id_fishbase = 'Umbra-limi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Umbra_limi}}';  
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
bibkey = 'RobiJirk2010'; type = 'Article'; bib = [ ...  
'author = {J. M. Robinson and K. J. Jirka and J. A. Chiott}, ' ...
'doi = {10.1111/j.1439-0426.2009.01357.x}, ' ...
'year = {2010}, ' ...
'title = {Age and growth analysis of the central mudminnow, \emph{Umbra limi} ({K}irtland, 1840)}, ' ... 
'journal = {J. Appl. Ichtthyol.}, ' ...
'volume = {26}, '...
'pages = {89-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Umbra-limi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

