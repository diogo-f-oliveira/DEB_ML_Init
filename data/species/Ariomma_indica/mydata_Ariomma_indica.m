function [data, auxData, metaData, txtData, weights] = mydata_Ariomma_indica
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Ariommatidae';
metaData.species    = 'Ariomma_indica'; 
metaData.species_en = 'Indian driftfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'biMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 27];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'ReubVija1996';   
  temp.am = C2K(27.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.1;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 25;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 56.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02042*Lp^2.92, see F1';
data.Wwi = 246.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02042*Li^2.92, see F1, gives 683 g';
 
data.Ri = 89322/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'KamaRast2018';
  temp.Ri = C2K(27.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.264	5.263
0.568	7.529
0.993	11.495
1.459	14.491
2.027	16.761
2.514	18.303
3.041	19.926
3.466	20.578
4.034	21.071
4.520	21.966
5.007	22.296
5.473	22.545
5.980	22.875];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ReubVija1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02042*(TL in cm)^2.92'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GMT3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Ariomma_indica'; % Wikipedia
metaData.links.id_ADW = 'Ariomma_indica'; % ADW
metaData.links.id_Taxo = '161646'; % Taxonomicon
metaData.links.id_WoRMS = '219752'; % WoRMS
metaData.links.id_fishbase = 'Ariomma-indica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Ariomma_indica}}';  
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
bibkey = 'ReubVija1996'; type = 'Article'; bib = [ ...
'author = {Reuben, S. and K. Vijayakumaran and P. Achayya}, ' ...
'year = {1996}, ' ...
'title = {Growth, maturity, mortality and exploitation of \emph{Ariomma indica} ({D}ay) from north {A}ndhra {P}radesh coast}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {43(1)}, '...
'pages = {39-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KamaRast2018'; type = 'inproceedings'; bib = [ ...
'author = {Eissa Kamali and Ali Reza Rastgoo and Mohammad Darvishi, and Reza Dehghani}, ' ...
'year = {2018}, ' ...
'title = {Determination of reproductive stages, sex ratio, length maturity and fecundity of {I}ndian driftfish in the {H}ormozgan {P}rovince}, ' ... 
'booktitle = {The 6th Iranian Conference of Ichthyology, Shahid Bahonar, University of Kerman, 27-28 August 2018}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ariomma-indica.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

