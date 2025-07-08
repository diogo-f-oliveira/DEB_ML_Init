function [data, auxData, metaData, txtData, weights] = mydata_Symphodus_roissali

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Symphodus_roissali'; 
metaData.species_en = 'Five-spotted wrasse'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 09]; 

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on 5 to 7 cm SL and SL= 0.85*TL from photo';
data.Li  = 20;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
  comment.Li = 'based on 17 cm TL and SL= 0.85*TL from photo';

data.Wwb = 2.4e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'RavePlan2009';
  comment.Wwb = 'based on egg diameter of 0.77 mm for Labrus meruls: pi/6*0.077^3';
data.Wwp = 6.3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','GordMoli2000'};
  comment.Wwp = 'based on 0.035*Lp^2.670, see F1';
data.Wwi = 104;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','GordMoli2000'};
  comment.Wwi = 'based on 0.035*Li^2.670, see F1';

data.Ri  = 2e5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'JirsDraw2007';   
  temp.Ri = C2K(18.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.94e6 eggs per kg per yr for Semicossyphus pulcher: 1.94e6*0.104/365';

% univariate data
data.tL = [ ... % time since birth (yr), total length (cm) 
0.413	4.517
0.413	4.996
0.414	5.982
0.414	6.066
0.414	6.432
0.414	6.432
0.414	6.432
0.414	6.461
0.415	6.996
0.415	6.996
0.423	5.475
0.424	7.559
0.576	5.445
0.581	5.952
0.586	6.515
0.587	7.050
0.587	7.050
0.587	7.107
0.592	7.895
0.593	8.994
0.921	7.019
0.922	7.441
0.922	7.949
0.922	7.949
0.922	7.949
0.922	7.949
0.922	7.949
0.922	8.456
0.922	8.456
1.085	8.003
1.086	8.933
1.086	8.933
1.086	8.933
1.086	8.933
1.086	8.933
1.087	10.369
1.095	9.327
1.095	9.975
1.095	9.975
1.095	9.975
1.095	9.975
1.098	6.989
1.159	10.369
1.411	8.056
1.411	8.591
1.411	8.591
1.411	8.986
1.411	8.986
1.411	8.986
1.411	8.986
1.425	9.549
1.426	10.000
1.502	9.013
1.502	9.013
1.503	10.450
1.583	8.590
1.587	8.505
1.597	9.012
1.597	9.012
1.666	10.561
1.666	10.561
1.913	9.065
1.913	9.065
1.913	9.065
1.913	9.065
1.919	10.953
1.920	11.488
1.927	9.431
2.091	10.951
2.091	10.951
2.092	11.937
2.408	10.469
2.500	12.581
2.500	12.581
2.500	12.975
2.507	10.975
2.517	12.017
2.676	12.889];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordMoli2000';

  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length weight: Ww in g = 0.035*(TL in cm)^2.670';
metaData.bibkey.F1 = 'GordMoli2000'; 
F2 = 'Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '53PKF'; % Cat of Life
metaData.links.id_ITIS = '614242'; % ITIS
metaData.links.id_EoL = '46571684'; % Ency of Life
metaData.links.id_Wiki = 'Symphodus_roissali'; % Wikipedia
metaData.links.id_ADW = 'Symphodus_roissali'; % ADW
metaData.links.id_Taxo = '188438'; % Taxonomicon
metaData.links.id_WoRMS = '273573'; % WoRMS
metaData.links.id_fishbase = 'Symphodus-roissali'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Symphodus_roissali}}';
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
bibkey = 'GordMoli2000'; type = 'Article'; bib = [ ... 
'author = {Ana Gordoa and Balbina Mol\''{i} and Nuria Ravent\''{o}s}, ' ... 
'year = {2000}, ' ...
'title = {Growth performance of four wrasse species on the north-western {M}editerranean coast}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {45}, ' ...
'pages = {43-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RavePlan2009'; type = 'Article'; bib = [ ... 
'author = {N. Raventos and S. Planes}, ' ... 
'year = {2009}, ' ...
'title = {Maternal size effects on early life traits of the temperate fish \emph{Symphodus roissali}}, ' ...
'journal = {Aquat. Biol.}, ' ...
'volume = {4}, ' ...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symphodus-roissali.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

