function [data, auxData, metaData, txtData, weights] = mydata_Argenteohyla_siemersi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Argenteohyla_siemersi'; 
metaData.species_en = 'Red-spotted Argentina frog'; 

metaData.ecoCode.climate = {'Am','Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj';  'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 27];

%% set data
% zero-variate data

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females';      bibkey.tp = 'CajaMara2013';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';    label.tpm = 'time since metam at puberty for males';      bibkey.tpm = 'CajaMara2013';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 22*365;units.am = 'd';    label.am = 'life span';                         bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';              bibkey.Lj  = 'CajaMara2013'; 
data.Li  = 8.7;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = 'CajaMara2013';
data.Lim  = 7.2; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'CajaMara2013';

data.Wwb = 2.7e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'DimiZara2008';
  comment.Wwb = 'based on egg diameter of 1.73  mm: pi/6*0.173^3';
data.Wwi = 34.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'CajaMara2013';
data.Wwim = 19.9; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'CajaMara2013';

data.Ri  = 2464/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';     bibkey.Ri  = 'DimiZara2008';   
  temp.Ri  = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2464 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (yr), SVL (cm): females, males
0	NaN   3.584
0	NaN   3.058
0	NaN   3.152
0	NaN   3.246
0	NaN   3.397
0	NaN   3.021
2	NaN   7.464
2	NaN   6.976
2	NaN   7.295
3	7.769 6.848
3	7.618 6.923
3   NaN   6.528
3   NaN   6.998
3   NaN   7.036
3   NaN   6.660
3   NaN   7.224
3   NaN   7.336
3   NaN   7.468
4	7.472 6.626
4	7.622 6.795
4	7.754 6.927
4	7.979 7.021
4   NaN   7.303
4   NaN   6.325
4   NaN   6.419
4   NaN   6.551
4   NaN   7.397
5	8.321 6.498
5	7.457 6.724
5   NaN   6.855
5   NaN   7.212
5   NaN   7.382];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1)+0); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(24);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'CajaMara2013'; treat.tL_fm = {1, {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since metam (month), wet weight (g)];
0	NaN    2.983
0	NaN    2.433
0	NaN    1.993
2	NaN    16.675
2	NaN    23.939
2	NaN    19.537
3	30.344 14.935
3   NaN    23.080
3   NaN    16.586
3   NaN    17.357
3   NaN    18.238
3   NaN    19.228
3   NaN    20.659
3   NaN    21.429
3   NaN    22.090
3   NaN    24.071
3   NaN    25.061
4	29.375 14.077
4	24.643 15.067
4	22.331 16.278
4	23.322 13.527
4	20.020 17.599
4	17.159 18.480
4	25.414 19.140
4   NaN    20.681
4   NaN    24.203
5	31.929 20.262
5	30.168 22.353
5   NaN    23.344
5   NaN    23.784
5   NaN    14.649
5   NaN    19.602];
data.tW_fm(:,1) = 365 * (data.tW_fm(:,1)+0); % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since metam', 'wet weight'};  
temp.tW_fm    = C2K(24);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm  = 'CajaMara2013'; treat.tW_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.tp = 5 * weights.tp;
weights.tpm = 5 * weights.tpm;
weights.Ri = 5 * weights.Ri;
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tL_fm;
weights.Wwi = 0 * weights.Wwi;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Inhabits de leaf axils of the bromeliad Aechimae in gallery forests along the river; Reporduction in temporary bools close to bromeliads';
metaData.bibkey.F1 = 'DimiZara2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GGDS'; % Cat of Life
metaData.links.id_ITIS = '662395'; % ITIS
metaData.links.id_EoL = '1025305'; % Ency of Life
metaData.links.id_Wiki = 'Argenteohyla_siemersi'; % Wikipedia
metaData.links.id_ADW = 'Argenteohyla_siemersi'; % ADW
metaData.links.id_Taxo = '137983'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Argenteohyla+siemersi'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argenteohyla_siemersi}}';
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
bibkey = 'CajaMara2013'; type = 'article'; bib = [ ...  
'doi = {10.1080/00222933.2012.743614}, ' ...
'author = {Rodrigo Cajade and Federico Marangoni and Elena Gangenova}, ' ...
'year = {2013}, ' ...
'title  = {Age, body size and growth pattern of \emph{Argenteohyla siemersi pederseni} ({A}nura: {H}ylidae) in northeastern {A}rgentina}, ' ...
'journal = {Journal of Natural History}, ' ...
'pages = {1-15}, ' ...
'volume = {615}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DimiZara2008'; type = 'article'; bib = [ ...  
'author = {Diminich MC and Zaracho VH.}, ' ...
'year = {2008}, ' ...
'title  = {\emph{Argenteohyla siemersi pederseni}. Reproduction}, ' ...
'journal = {Herpetol Rev.}, ' ...
'pages = {74–75}, ' ...
'volume = {39(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-scientific_name=contains&where-scientific_name=Argenteohyla+siemersi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

