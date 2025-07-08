  function [data, auxData, metaData, txtData, weights] = mydata_Blicca_bjoerkna

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Blicca_bjoerkna'; 
metaData.species_en = 'White bream'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 14]; 

%% set data
% zero-variate data
data.ah = 3;        units.ah = 'd';  label.ah = 'age at hatch';                   bibkey.ah = 'SchoBreu2006'; 
  temp.ah = C2K(20); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 7.5;       units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'SchoBreu2006'; 
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4.5*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'SchoBreu2006';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3.5*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'SchoBreu2006';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'SchoBreu2006';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.75;    units.Lb = 'cm'; label.Lb = 'total length at birth';            bibkey.Lb = 'SchoBreu2006'; 
data.Lp = 16;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'SchoBreu2006'; 
data.Lpm = 14;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'SchoBreu2006'; 
data.Li = 40;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'SchoBreu2006';

data.Wwb = 3.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'SchoBreu2006';
  comment.Wwb = 'Based on egg diameter of 1.8 mm: 4/3*pi*0.09^3';

data.Ri = 1e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'SchoBreu2006';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1 12.2
2 14.0
3 14.9
4 17.2
5 19.7
6 22.3];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2) * 148/135; % convert fork to total length, base on photo
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YilmYazi2015';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
1  26.1
2  41.9
3  51.3
4  84.9
5 135.9
6 204.5];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'YilmYazi2015';

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
11.447	24.037
11.963	22.607
11.963	32.050
11.984	27.693
12.128	26.973
12.293	26.981
12.355	24.804
12.356	29.889
12.624	26.269
12.624	36.439
12.645	32.081
12.748	26.275
12.789	32.088
12.954	32.822
12.955	42.991
13.099	32.102
13.100	42.998
13.244	35.014
13.285	43.006
13.429	32.843
13.533	38.659
13.657	44.476
13.822	35.767
13.843	43.758
13.946	44.489
13.988	50.302
14.028	35.776
14.111	43.044
14.194	49.585
14.195	53.943
14.214	39.417
14.359	47.413
14.421	40.152
14.525	48.147
14.525	52.506
14.607	41.613
14.607	48.151
14.690	56.145
14.814	49.613
14.854	42.351
14.855	56.879
15.000	53.254
15.021	61.245
15.185	46.725
15.227	51.811
15.227	56.170
15.269	62.709
15.412	46.735
15.454	57.633
15.517	70.711
15.600	74.346
15.640	52.556
15.723	60.550
15.784	47.478
15.827	67.819
15.951	78.721
15.991	53.299
15.991	60.563
16.013	70.733
16.055	82.357
16.198	62.751
16.199	75.100
16.220	78.733
16.302	70.746
16.342	56.220
16.344	82.370
16.425	67.846
16.447	86.007
16.507	62.039
16.509	79.472
16.611	70.760
16.613	89.646
16.695	83.839
16.777	77.305
16.859	68.592
16.880	76.584
16.943	88.935
17.088	96.932
17.170	83.861
17.231	73.694
17.293	70.791
17.356	96.218
17.418	89.683
17.438	78.788
17.500	86.055
17.502	110.026
17.563	96.227
17.602	73.711
17.624	90.419
17.666	94.779
17.686	81.705
17.687	101.318
17.830	77.353
17.872	88.251
17.872	95.515
17.914	106.413
17.977	118.038
18.059	114.409
18.079	99.883
18.161	91.896
18.223	85.361
18.326	90.451
18.389	102.802
18.410	114.425
18.492	96.996
18.575	110.801
18.617	119.520
18.700	126.787
18.741	116.620
18.761	107.177
18.905	100.646
18.989	123.895
19.009	111.547
19.197	140.611
19.216	120.273
19.277	105.748
19.299	129.720
19.319	113.740
19.319	122.457
19.484	117.380
19.485	126.823
19.606	94.141
19.651	134.821
19.712	127.560
19.816	140.639
19.817	152.988
19.856	121.755
19.898	128.294
20.001	121.762
20.043	136.291
20.127	163.898
20.187	125.402
20.187	131.939
20.230	148.648
20.291	142.840
20.354	155.192
20.477	149.386
20.500	174.811
20.643	158.110
20.686	181.357
20.828	146.496
21.077	158.130
21.138	149.416
21.161	178.473
21.182	187.190
21.182	188.643
21.262	145.790
21.303	152.329
21.387	166.134
21.532	175.584
21.553	186.481
21.614	172.682
24.304	260.698];
data.LW(:,1) = data.LW(:,1) * 148/135; % convert fork to total length, based on photo
units.LW = {'d', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'YilmYazi2015';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '68LRL'; % Cat of Life
metaData.links.id_ITIS = '163661'; % ITIS
metaData.links.id_EoL = '46581639'; % Ency of Life
metaData.links.id_Wiki = 'Blicca_bjoerkna'; % Wikipedia
metaData.links.id_ADW = 'Blicca_bjoerkna'; % ADW
metaData.links.id_Taxo = '43617'; % Taxonomicon
metaData.links.id_WoRMS = '154274'; % WoRMS
metaData.links.id_fishbase = 'Blicca-bjoerkna'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Blicca_bjoerkna}}';  
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
bibkey = 'SchoBreu2006'; type = 'Techreport'; bib = [ ...  
'author = {C. H. Schoone and M. van Breugel}, ' ...
'year = {2006}, ' ...
'title = {Kennisdocument kolblei, \emph{Abramis} (of \emph{Blicca}) \emph{bjoerkna} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {19}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-kolblei_4553.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1450}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YilmYazi2015'; type = 'Article'; bib = [ ...  
'author = {S. Yilmaz and O. Yazicioglu and R. Yazici and N. Polat}, ' ...
'year = {2015}, ' ...
'title = {Age,  Growth  and  Reproductive  Period  of  White  Bream, \emph{Blicca  bjoerkna} ({L}., 1758) in {L}ake {L}adik, {T}urkey}, ' ... 
'journal = {Journal of Limnology and Freshwater Fisheries Research}, ' ...
'volume = {1}, ' ...
'number = {1}, ' ...
'pages = {9--18}, ' ...
'howpublished = {\url{http://www.limnofish.org/download/article-file/181159}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
