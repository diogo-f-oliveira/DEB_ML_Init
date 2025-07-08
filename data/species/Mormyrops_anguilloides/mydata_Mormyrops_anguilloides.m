  function [data, auxData, metaData, txtData, weights] = mydata_Mormyrops_anguilloides
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Mormyridae';
metaData.species    = 'Mormyrops_anguilloides'; 
metaData.species_en = 'Cornish jack'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 05];

%% set data
% zero-variate data
data.ab = 17; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'FarrYoun2022';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 32.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'MekkHass2012';
data.Li = 150;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MekkHass2012';
  comment.Wwb = 'based on egg diameter of 2.1 mm: pi/6*0.21^3';
data.Wwp = 186.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'MekkHass2012','fishbase'};
  comment.Wwp = 'based on 0.00562*Lp^2.99, see F1';
data.Wwi = 18e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^2.99, see F1';
  
data.Ri = 35.5e3/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Mormyrus_kannume: 17369*18e3/8.8e3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
204.679	11.189
250.304	13.096
264.878	13.091
296.562	13.216
365+140.043	16.162
365+159.054	16.705
365+206.411	19.025
365+249.670	20.657
365+297.196	20.914
730+129.271	21.802
730+145.113	21.521
730+161.589	23.027
730+206.580	25.209
1095+143.212	27.157
1460+130.538	29.224
1460+160.321	30.862
1460+205.946	31.257
1460+297.196	33.010];
data.tL(:,1) = data.tL(:,1) + 280; % convert yr to d
units.tL = {'d', 'cm', 'g'};  label.tL = {'time since birth', 'length', 'weight'};  
temp.tL = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TahJoan2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73RB6'; % Cat of Life
metaData.links.id_ITIS = '649894'; % ITIS
metaData.links.id_EoL = '208738'; % Ency of Life
metaData.links.id_Wiki = 'Mormyrops_anguilloides'; % Wikipedia
metaData.links.id_ADW = 'Mormyrops_anguilloides'; % ADW
metaData.links.id_Taxo = '180353'; % Taxonomicon
metaData.links.id_WoRMS = '581710'; % WoRMS
metaData.links.id_fishbase = 'Mormyrops_anguilloides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Mormyrops_anguilloides}}';  
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
bibkey = 'TahJoan2010'; type = 'Article'; bib = [ ...    
'author = {Tah, L. and T.G. Joanny and V. N''Douby and J.N. Kouassi and J. Moreau}, ' ...
'year  = {2010}, ' ...
'title = {Preliminary estimates of the population parameters of major fish species in {L}ake {A}yam\''{e} {I} ({B}ia basin; C\^{o}te d''{I}voire)}, ' ...  
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {26(1)}, ' ...
'pages = {57-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mormyrops-anguilloides.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

