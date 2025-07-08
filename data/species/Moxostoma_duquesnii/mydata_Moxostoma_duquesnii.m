  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_duquesnii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_duquesnii'; 
metaData.species_en = 'Black redhorse'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
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
data.am = 16*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'Reid2009'; 
data.Li = 51;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 0.144;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2.6-2.9 mm: pi/6*0.275^3';
data.Wwp = 36.6; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Reid2009'};
  comment.Wwp = 'based on 0.01175*Lp^2.97, see F1';
data.Wwi = 1.39e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^2.97, see F1';

data.Ri = 750/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.85, which is in the range of other Moxostoma species.';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
-0.041	9.446
-0.039	7.697
-0.039	7.697
-0.039	6.997
0.934	15.035
0.934	13.985
0.934	13.461
0.965	21.507
0.965	20.632
0.966	19.408
0.966	18.883
0.967	17.834
0.967	17.309
0.968	16.609
0.968	16.259
0.968	15.035
1.803	19.925
1.804	19.051
1.871	23.248
1.902	30.245
1.902	29.720
1.903	27.971
1.904	27.271
1.904	26.397
1.905	25.872
1.905	25.172
1.905	24.647
1.906	24.123
1.907	22.373
1.907	20.974
1.909	18.000
1.909	17.650
1.910	15.901
2.880	28.487
2.882	26.388
2.882	25.688
2.947	34.259
2.949	31.286
3.019	29.711
3.089	30.410
3.885	41.598
3.921	38.974
3.922	37.924
3.923	36.875
3.923	35.650
3.924	34.950
3.960	33.201
4.792	42.990
4.895	44.563
4.897	41.939
4.900	37.391
4.900	36.516
4.933	39.490
4.934	37.566
4.936	35.117
5.806	40.007
5.875	41.231
5.875	40.531
5.876	39.656
5.907	45.429
5.908	44.029
5.908	43.505
5.909	42.630
5.909	42.105
5.909	41.580
5.911	39.306
5.941	47.528
5.946	38.256
6.016	37.731
6.017	36.856
6.849	46.295
6.917	49.618
6.923	38.598
6.924	37.723
6.954	45.944
6.956	43.146
6.956	41.921
6.957	39.997
6.992	40.871
7.931	47.160
7.932	44.012
7.999	48.909
8.873	47.327
8.875	44.003
8.877	39.980
8.944	45.927
9.849	49.243
9.990	47.492
9.992	44.169
10.865	42.762
10.898	46.435
10.898	45.735
10.899	44.510
10.931	49.758
10.932	48.184
10.932	47.309
10.932	46.959
11.907	51.849
11.908	50.799
11.908	49.225
11.944	48.350
12.014	47.649
12.816	48.342
12.886	49.566
12.888	45.543
12.919	51.490
12.922	47.117
13.862	51.132
13.863	49.383
13.865	45.184
13.866	44.310
13.897	50.432
13.899	47.808
14.843	45.001
14.910	49.898
15.885	53.388
15.888	48.840
15.921	51.988
15.957	49.539];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Reid2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 0 * weights.Ri;

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
F1 = 'length-weight: Ww in g = 0.01175 * (TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6S37M'; % Cat of Life
metaData.links.id_ITIS = '553274'; % ITIS
metaData.links.id_EoL = '805456'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_duquesnii'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_duquesnii'; % ADW
metaData.links.id_Taxo = '180408'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-duquesnii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_duquesnii}}';  
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
bibkey = 'Reid2009'; type = 'Article'; bib = [ ...  
'author = {S. M. Reid}, ' ...
'year = {2009}, ' ...
'title = {Age, growth and mortality of black redhorse (\emph{Moxostoma duquesnei}) and shorthead redhorse (\emph{M. macrolepidotum}) in the {G}rand {R}iver, {O}ntario}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {25}, '...
'pages = {178-183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-duquesnii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

