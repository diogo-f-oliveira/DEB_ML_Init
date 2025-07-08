function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_macloti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_macloti'; 
metaData.species_en = 'Hardnose shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
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

data.ab = 0.95*365;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'fishbase';   
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'SmarHarr2013';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 47.5;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '45-50 cm';
data.Lp  = 62;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 110;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 8.5e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00437*Li^3.08, see F1';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter per yr';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.015	49.549
0.017	44.314
0.037	42.301
0.077	39.081
1.000	62.467
1.002	56.427
1.002	54.817
1.003	51.998
1.005	47.568
1.950	61.291
1.986	69.749
1.988	64.111
1.989	59.682
2.010	55.656
2.957	64.949
2.958	60.922
2.972	77.836
2.975	68.171
2.993	71.796
3.033	68.979
3.960	81.090
3.963	70.218
4.001	74.246
4.023	64.582
4.058	76.261
4.969	77.903
4.969	76.695
4.987	83.138
4.990	73.474
4.991	69.850
5.975	85.185
5.975	83.171
5.996	79.951
6.016	76.730
6.036	74.717
6.963	87.231
6.983	83.608
7.003	81.595
7.024	77.972
7.989	89.279
7.991	85.655
7.992	82.434
7.993	79.615
8.997	90.118
8.998	87.300
8.999	83.676
9.947	90.956
9.988	83.709
10.065	86.933
10.957	85.755
10.975	90.185
10.975	87.769];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'SmarHarr2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00437 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '68ZKN'; % Cat of Life
metaData.links.id_ITIS = '160420'; % ITIS
metaData.links.id_EoL = '46559791'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_macloti'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_macloti'; % ADW
metaData.links.id_Taxo = '106450'; % Taxonomicon
metaData.links.id_WoRMS = '217335'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-macloti'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_macloti}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-macloti.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

