  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_poecilurum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_poecilurum'; 
metaData.species_en = 'Blacktail redhorse'; 

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
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'GrabYoun2012';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'GrabYoun2012'; 
  comment.Lp = 'based on tp 3-4 yr, and tL data';
data.Li = 51;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 9.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'GrabYoun2012';
  comment.Wwb = 'based on egg weight';
data.Wwi = 1.26e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.97, see F1';

data.Ri = 12*1.26e3/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'GrabYoun2012';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on mean # eggs per weight';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
0.944	9.774
0.944	11.274
0.973	18.774
0.973	20.524
0.973	22.524
1.032	13.276
1.062	16.027
1.062	17.277
1.976	28.049
1.976	26.799
1.976	25.299
1.976	23.549
2.006	29.800
2.006	22.300
2.035	36.801
2.035	35.551
2.035	34.801
2.035	31.551
2.035	21.301
2.035	19.051
2.035	16.801
2.065	20.302
2.979	22.824
2.979	40.324
2.979	41.324
3.009	29.325
3.009	30.575
3.009	32.075
3.038	26.076
3.038	34.076
3.038	36.076
3.038	37.576
3.038	38.826
3.068	27.327
3.068	43.577
3.982	47.100
3.982	26.850
4.012	40.850
4.012	39.600
4.012	37.850
4.041	44.601
4.041	42.351
4.041	36.351
4.071	34.852
4.071	33.352
4.071	31.852
4.071	28.602
4.985	30.375
4.985	32.125
4.985	33.625
4.985	44.875
4.985	45.375
5.015	39.625
5.015	41.125
5.015	43.125
5.015	47.375
5.044	35.126
5.044	36.626
5.044	48.626
5.044	49.626
5.074	37.877
5.988	52.650
5.988	36.400
5.988	34.900
5.988	32.150
6.018	49.400
6.018	47.650
6.018	46.650
6.018	45.400
6.018	43.900
6.018	38.900
6.018	37.650
6.047	42.901
6.047	41.651
6.047	40.901
6.047	40.151
6.932	35.923
6.932	38.173
6.932	39.423
6.962	41.174
6.962	42.424
6.962	46.924
6.991	48.425
7.021	43.676
7.021	44.926
7.050	49.676
7.050	50.926
7.965	42.949
7.965	43.699
7.994	46.450
7.994	49.700
7.994	51.700];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GrabYoun2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

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
F1 = 'length-weight: Ww in g = 0.01072 * (TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '742VL'; % Cat of Life
metaData.links.id_ITIS = '163932'; % ITIS
metaData.links.id_EoL = '204291'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_poecilurum'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_poecilurum'; % ADW
metaData.links.id_Taxo = '180416'; % Taxonomicon
metaData.links.id_WoRMS = '1378190'; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-poecilurum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_poecilurum}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-poecilurum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

