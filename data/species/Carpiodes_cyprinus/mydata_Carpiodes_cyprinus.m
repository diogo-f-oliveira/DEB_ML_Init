  function [data, auxData, metaData, txtData, weights] = mydata_Carpiodes_cyprinus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Carpiodes_cyprinus'; 
metaData.species_en = 'Quillback'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 03]; 

%% set data
% zero-variate data
data.am = 30*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'GrabYoun2012';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 39;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'GrabYoun2012'; 
  comment.Lp = 'based on tp 5 yr, and tL data';
data.Li = 66;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 2.5e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'GrabYoun2012';
  comment.Wwb = 'based on egg weight';
data.Wwi = 3.42e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.02, see F1';

data.Ri = 45.1*3.42e3/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'GrabYoun2012';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on mean # eggs per weight';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
0.926	12.645
0.927	14.380
0.983	8.926
0.984	10.661
0.987	16.612
0.988	17.851
0.988	18.843
0.989	20.331
0.990	21.818
1.938	18.843
1.939	21.322
1.940	22.314
1.940	23.554
1.941	24.545
1.942	26.529
1.945	33.967
1.967	17.107
1.972	27.273
1.974	31.983
1.995	14.628
1.995	15.372
2.003	30.000
2.919	22.066
2.949	23.802
2.950	25.537
2.951	26.529
2.981	27.769
2.986	39.174
2.987	40.413
3.015	36.446
3.041	29.256
3.042	30.496
3.043	32.479
3.043	33.719
3.963	33.223
3.963	33.967
3.964	35.455
3.965	37.438
3.989	26.033
3.990	27.273
3.991	30.000
3.991	30.744
3.992	31.983
3.999	45.868
4.025	39.669
4.056	41.405
4.057	43.388
4.999	29.256
5.001	31.983
5.001	33.223
5.002	35.207
5.003	37.190
5.004	38.678
5.007	43.884
5.007	45.372
5.034	40.165
5.035	41.901
5.039	49.587
5.987	46.860
6.009	31.488
6.018	48.347
6.040	34.215
6.041	35.455
6.042	37.190
6.043	39.174
6.073	40.909
6.075	43.140
6.075	44.876
6.990	33.471
7.052	39.421
7.052	39.917
7.053	42.645
7.054	44.380
7.055	46.612
7.087	49.587
7.976	48.347
8.000	36.198
8.986	50.579
9.010	37.934];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GrabYoun2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

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
F1 = 'length-weight: Ww in g = 0.01096 * (TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'RG64'; % Cat of Life
metaData.links.id_ITIS = '163917'; % ITIS
metaData.links.id_EoL = '203994'; % Ency of Life
metaData.links.id_Wiki = 'Carpiodes_cyprinus'; % Wikipedia
metaData.links.id_ADW = 'Carpiodes_cyprinus'; % ADW
metaData.links.id_Taxo = '43910'; % Taxonomicon
metaData.links.id_WoRMS = '1022879'; % WoRMS
metaData.links.id_fishbase = 'Carpiodes-cyprinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carpiodes_cyprinus}}';  
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
bibkey = 'GrabYoun2012'; type = 'Article'; bib = [ ...  
'author = {Timothy B. Grabowski and Shawn P. Young and J. Jeffery Isely and Patrick C. Ely}, ' ...
'year = {2012}, ' ...
'title = {Age, Growth, and Reproductive Biology of Three {C}atostomids From the {A}palachicola {R}iver, {F}lorida}, ' ... 
'journal = {Journal of Fish and Wildlife Management}, ' ...
'volume = {3(2)}, '...
'pages = {223-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Carpiodes-cyprinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

