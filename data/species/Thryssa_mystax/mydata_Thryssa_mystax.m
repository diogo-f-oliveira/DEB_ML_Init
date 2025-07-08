  function [data, auxData, metaData, txtData, weights] = mydata_Thryssa_mystax
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Thryssa_mystax'; 
metaData.species_en = 'Moustached thryssa'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 05];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2.2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'KendNirm2018';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 21;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'KendNirm2018';

data.Wwb = 5.2e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GowdSoma2016';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 13.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00603*Lp^3.0, see F1';
data.Wwi = 55.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','KendNirm2018'};
  comment.Wwi = 'based on  0.00603*Li^3.0, see F1; max. published weight: 60.70 g ';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
0.154	33.244
0.254	54.443
0.353	70.819
0.440	84.785
0.523	98.270
0.597	108.381
0.680	118.008
0.751	125.707
0.825	134.371
0.895	141.589
0.960	147.361
1.021	154.099
1.075	157.944
1.127	162.755
1.216	170.932
1.332	177.173
1.377	180.056
1.611	193.503
1.659	194.456
1.884	205.011
1.935	206.445
2.170	213.621];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'KendNirm2018';

% length-fecundity
data.LN = [ ... 10log length (cm), 10log fecundity (#)
1.281	4.305
1.283	4.180
1.283	4.159
1.283	4.153
1.288	4.232
1.290	4.307
1.290	4.326
1.290	4.276
1.290	4.353
1.297	4.281
1.301	4.255
1.305	4.266
1.305	4.246
1.305	4.234
1.308	4.299
1.310	4.367];
data.LN = 10.^data.LN; % remove log transform
units.LN = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
  temp.LN = C2K(28.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'GowdSoma2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 20;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;
weights.LN = weights.LN * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.0'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56NJH'; % Cat of Life
metaData.links.id_ITIS = '551413'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Thryssa_mystax'; % Wikipedia
metaData.links.id_ADW = 'Thryssa_mystax'; % ADW
metaData.links.id_Taxo = '189021'; % Taxonomicon
metaData.links.id_WoRMS = '275559'; % WoRMS
metaData.links.id_fishbase = 'Thryssa-mystax'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Thryssa_mystax}}';  
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
bibkey = 'KendNirm2018'; type = 'Article'; bib = [ ... 
'author = {Kende, D.R. and Nirmale, V.H. and Metar, S.Y. and Pawar, R.A}, ' ...
'year = {2018}, ' ...
'title = {Studies on growth and mortality of Moustached Thryssa, \emph{Thryssa mystax} ({S}chneider, 1801) along the {R}atnagiri coast of {M}aharashtra, {I}ndia}, ' ... 
'journal = {Indian Journal of Geo Marine Sciences}, ' ...
'volume = {47(5)}, '...
'pages = {1065-1068}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GowdSoma2016'; type = 'Article'; bib = [ ... 
'author = {Priyanka M. Gowda and S. R. Somashekara and D. P. Rajesh and S. Benakappa and Umesh Suryawanshi and B. J. Deepa Shree}, ' ...
'year = {2016}, ' ...
'title = {BREEDING BIOLOGY OF \emph{Thryssa mystax} ({B}LOCH \& {S}CHNEIDER, 1801) OFF {M}ANGALURU {C}OAST}, ' ... 
'journal = {J. Exp. Zool. India Vol.}, ' ...
'volume = {19(2)}, '...
'pages = {835-841}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Thryssa-mystax.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  