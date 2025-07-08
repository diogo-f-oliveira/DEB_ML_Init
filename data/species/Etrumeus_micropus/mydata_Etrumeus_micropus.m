function [data, auxData, metaData, txtData, weights] = mydata_Etrumeus_micropus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dussumieriidae';
metaData.species    = 'Etrumeus_micropus'; 
metaData.species_en = 'Pacific round herring'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 09];

%% set data
% zero-variate data;

data.ab = 30;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';    
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'WaldPros1991';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 18;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'OhshGoto2011';
data.Li  = 28.3; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.3-1.47 mm : pi/6*0.138^3';
data.Wwp = 37.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'OhshGoto2011','fishbase'};
  comment.Wwp = 'based on 0.00468*Lp^3.11, see F1';
data.Wwi = 100;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'RoelMelo1990';
  comment.Wwi = 'based on 0.00468*Li^3.11, see F1';

data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'OhshGoto2011';
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL = [ % time since birth (d), standard length (cm)
56.661	4.922
77.148	4.798
87.210	6.060
126.128	5.875
152.403	8.335
183.047	8.780
211.378	11.178
245.952	12.820
274.524	13.453
302.760	16.544
331.253	17.745
364.030	17.559
392.438	19.390
423.297	18.258
451.809	19.333
480.552	18.706
548.024	19.280
572.355	20.984
609.192	21.051
672.475	22.318
699.120	22.068
727.794	21.945
789.057	23.023
817.619	23.719
850.663	21.580
881.298	22.087
914.007	22.406
940.462	23.543
964.991	23.798
999.746	24.116
1034.536	24.183
1065.249	24.123
1095.867	24.757];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OhshGoto2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 2 * weights.Li;
weights.Wwb = 2 * weights.Wwb;
weights.Wwi = 2 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00468*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6H4WP'; % Cat of Life
metaData.links.id_ITIS = '161745'; % ITIS
metaData.links.id_EoL = '46562763'; % Ency of Life
metaData.links.id_Wiki = 'Etrumeus_micropus'; % Wikipedia
metaData.links.id_ADW = 'Etrumeus_micropus'; % ADW
metaData.links.id_Taxo = '376028'; % Taxonomicon
metaData.links.id_WoRMS = '217442'; % WoRMS
metaData.links.id_fishbase = 'Etrumeus-micropus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etrumeus_micropus}}';
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
bibkey = 'OhshGoto2011'; type = 'Article'; bib = [ ...
'author = {Seiji Ohshimo and Tsuneo Gotoh and Toru Otsuka and Kojiro Gejima}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth and reproductive characteristics of round herring \emph{Etrumeus teres} in the {E}ast {C}hina {S}ea}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {77(1)}, ' ...
'pages = {15-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Etrumeus-micropus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  
