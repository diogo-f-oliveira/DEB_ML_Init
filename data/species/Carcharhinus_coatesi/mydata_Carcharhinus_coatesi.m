function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_coatesi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_coatesi'; 
metaData.species_en = 'Coates''s shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MIE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 22];


%% set data
% zero-variate data
data.ab = 0.8*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'SmarHarr2013';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 39;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '38-40 cm';
data.Lp  = 70;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 88;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 87;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwi = 5.1e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00479*Li^3.10, see F1';

data.Ri  = 2/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 till 3 pups per litter, 1 litter per 2 yrs assumed';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	50.320
0.000	40.655
0.000	39.044
0.000	44.681
0.000	46.695
0.476	66.813
0.490	50.302
0.511	54.731
0.511	56.342
0.512	59.161
0.513	59.563
0.513	62.382
1.503	60.336
1.505	65.570
1.505	66.376
1.506	68.792
1.506	70.403
1.507	73.221
1.508	76.443
1.529	80.469
2.495	64.732
2.496	69.564
2.497	72.785
2.517	74.798
2.520	82.449
2.557	77.213
2.558	79.226
3.491	82.417
3.509	79.597
3.511	86.040
3.524	65.905
3.526	70.737
3.527	74.362
3.528	78.388
4.461	80.371
4.462	82.787
4.463	86.411
4.479	76.746
4.498	73.121
4.522	89.228
5.452	81.143
5.453	86.378
5.489	75.907
5.513	92.013
6.499	79.094
6.501	82.718
6.502	87.550];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'SmarHarr2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M  = 8 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00479 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'depth range > 123 m';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'R3N7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4536011'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_coatesi'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5299606'; % Taxonomicon
metaData.links.id_WoRMS = '1014961'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-coatesi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_coatesi}}';
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
bibkey = 'SmarHarr2013'; type = 'Article'; bib = [ ... 
'doi = {10.1002/aqc.2274}, ' ...
'author = {Jonathan J. Smart and Alastair V. Harry and Andrew J. Tobin and Colin A. Simpfendorfer}, ' ... 
'year = {2013}, ' ...
'title = {Overcoming the constraints of low sample sizes to produce age and growth data for rare or threatened sharks}, ' ...
'journal = {Aquatic Conserv: Mar. Freshw. Ecosyst.}, ' ...
'volume = {23}, ' ...
'pages = {124-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-coatesi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

