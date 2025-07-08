  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_carinatum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_carinatum'; 
metaData.species_en = 'River redhorse'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 27]; 

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'BeckHuts2012';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'BeckHuts2012'; 
data.Li = 77;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 5.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.2 mm of Catostomus catostomus: pi/6*0.22^3';
data.Wwp = 329.5; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','BeckHuts2012'};
  comment.Wwp = 'based on 0.01000*Lp^2.95, see F1';
data.Wwi = 3.67e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^2.95, see F1';

data.Ri = 71920/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Moxostoma valenciennesi ';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
0.855	21.792
1.229	20.325
1.258	19.224
1.259	17.390
1.317	16.106
1.773	24.177
1.798	33.166
1.829	28.396
1.856	30.414
2.373	32.065
2.378	20.875
2.775	32.799
2.777	28.763
2.807	26.378
2.830	37.018
2.836	25.645
2.887	38.852
2.888	35.734
2.892	29.130
2.917	34.817
2.918	32.799
2.943	41.237
2.976	31.882
2.977	30.781
3.001	39.769
3.120	32.065
3.205	35.367
3.232	38.118
3.317	40.136
3.351	30.231
3.434	36.284
3.460	41.971
3.521	35.550
3.521	34.083
3.719	41.604
3.722	35.183
3.806	40.136
3.831	47.107
3.835	38.669
3.837	35.734
3.839	31.331
3.951	37.385
3.974	48.024
3.981	33.349
4.007	39.769
4.150	41.787
4.179	41.053
4.180	37.568
4.212	31.882
4.239	35.550
4.240	33.349
4.263	44.355
4.265	41.971
4.410	39.219
4.467	39.953
4.494	41.971
4.517	54.628
4.555	36.284
4.608	43.988
4.753	41.971
4.778	48.941
4.813	36.468
4.873	32.615
4.891	52.610
4.892	51.509
4.899	37.752
4.947	55.545
4.951	49.308
4.952	45.823
4.982	43.988
4.983	41.420
5.530	39.586
5.613	46.923
5.666	55.178
5.698	47.841
5.814	46.740
5.838	55.729
5.870	50.042
5.898	51.693
5.901	44.355
6.009	59.581
6.186	48.758
6.214	50.225
6.329	52.060
6.332	45.273
6.850	43.071
6.988	54.628
7.020	48.574
7.105	51.143
7.108	44.906
7.133	53.160
7.250	47.657
7.364	49.492
7.392	51.876
7.478	52.610
7.562	55.912
7.566	49.125
7.649	54.078
7.965	54.261
8.055	46.557
8.198	48.941
8.399	48.024
8.513	50.592
8.539	57.013
8.566	59.397
8.765	63.433
8.855	56.829
8.855	56.462
8.883	58.480
9.026	59.581
9.081	65.267
9.514	60.314
9.660	56.462
9.743	61.782
9.747	54.995
9.890	56.462
10.204	59.214
10.205	58.297
10.292	55.362
10.550	58.297
10.806	61.782
11.097	55.912
11.121	64.167
11.239	57.746
11.669	61.415
11.729	56.279
11.872	57.379
12.012	64.900
12.013	62.149
12.041	63.800
12.273	59.214
12.472	63.983
12.472	63.616
12.703	61.782
12.733	60.131
12.821	56.095
12.961	62.149
13.306	61.965
13.621	65.634
13.737	61.965
13.763	67.652
13.797	58.113
13.967	62.149
14.166	66.001
14.312	61.782
14.396	65.818
14.484	63.800
14.571	61.965
14.631	56.279
14.856	65.267
15.168	62.296
15.305	64.937];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BeckHuts2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000 * (TL in cm)^2.95'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44GTW'; % Cat of Life
metaData.links.id_ITIS = '163936'; % ITIS
metaData.links.id_EoL = '204285'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_carinatum'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_carinatum'; % ADW
metaData.links.id_Taxo = '180405'; % Taxonomicon
metaData.links.id_WoRMS = '1421422'; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-carinatum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_carinatum}}';  
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
bibkey = 'BeckHuts2012'; type = 'Article'; bib = [ ...  
'author = {Beckman, Daniel W. and Hutson, Christian A.}, ' ...
'year = {2012}, ' ...
'title = {Validation of Aging Techniques and Growth of the River Redhorse, \emph{Moxostoma carinatum}, in the {J}ames {R}iver, {M}issouri}, ' ... 
'journal = {The Southwestern Naturalist}, ' ...
'volume = {57(3)}, '...
'pages = {240-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-carinatum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

