function [data, auxData, metaData, txtData, weights] = mydata_Gadus_chalcogrammus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Gadus_chalcogrammus'; 
metaData.species_en = 'Alaska pollock'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2018 12 14]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 14]; 

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';    
  temp.ab = C2K(9.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'besed on Pollachus virens';
data.am = 28*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36.9;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 91;    units.Li = 'cm';   label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.15  mm for Polloachius virens: pi/6*0.115^3';
data.Wwp = 357;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00661*Lp^3.02, see F1';
data.Wwi = 5.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00661*Li^3.02, see F1';

data.Ri = 4e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data 
data.tL = [ ... % age class (yr) ~ Length (cm) 
0.797	20.521
1.904	30.095
2.824	35.965
3.935	42.557
4.817	46.995
5.928	53.587
6.813	56.355
7.930	58.533
8.891	61.542
9.931	63.718
10.973	63.866
11.820	65.560
12.977	66.785
13.749	66.687
14.752	67.788
15.754	69.129
16.949	70.235
17.839	69.187
18.842	69.453
19.806	70.315
20.733	70.341
21.893	68.942
22.892	72.548
23.934	73.531
24.863	71.291
26.022	70.488
26.793	71.464
27.720	71.132
28.840	71.401
29.728	71.068];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.7); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LaiGund1987';

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
D1 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00661*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6K6PF'; % Cat of Life
metaData.links.id_ITIS = '934083'; % ITIS
metaData.links.id_EoL = '216657'; % Ency of Life
metaData.links.id_Wiki = 'Gadus_chalcogrammus'; % Wikipedia
metaData.links.id_ADW = 'Gadus_chalcogrammus'; % ADW
metaData.links.id_Taxo = '388036'; % Taxonomicon
metaData.links.id_WoRMS = '300735'; % WoRMS
metaData.links.id_fishbase = 'Gadus-chalcogrammus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gadus_chalcogrammus}}';
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
bibkey = 'LaiGund1987'; type = 'article'; bib = [ ...
'author = {H. L. Lai and D. R. Gunderson}, ' ... 
'year   = {1987}, ' ...
'title  = {Effects of Ageing Errors on Estimates of Growth, Mortality and Yield per Recruit for Walleye Pollock (\emph{Theragra chalcogramma})}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {287-302}, ' ...
'volume = {5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Gadus-chalcogrammus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

