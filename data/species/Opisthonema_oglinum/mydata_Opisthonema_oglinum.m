function [data, auxData, metaData, txtData, weights] = mydata_Opisthonema_oglinum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Opisthonema_oglinum'; 
metaData.species_en = 'Atlantic thread herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 01 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 28]; 


%% set data
% zero-variate data;

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'VegaMexi1997';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 11.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 38; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm: pi/6*0.25^3';
data.Wwi = 533;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.03, see F1; fishbase gives 375 g as max published';

data.Ri  = 120e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(25.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (yr), fork length (cm)
0.976	7.235
2.001	9.372
3.010	11.216
3.987	12.987
4.974	14.341
6.010	14.912
6.998	15.361];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.2; % convert FL to TL, on the basis of photo
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VegaMexi1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74QVF'; % Cat of Life
metaData.links.id_ITIS = '161748'; % ITIS
metaData.links.id_EoL = '46562453'; % Ency of Life
metaData.links.id_Wiki = 'Opisthonema_oglinum'; % Wikipedia
metaData.links.id_ADW = 'Opisthonema_oglinum'; % ADW
metaData.links.id_Taxo = '182010'; % Taxonomicon
metaData.links.id_WoRMS = '158695'; % WoRMS
metaData.links.id_fishbase = 'Opisthonema-oglinum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Opisthonema_oglinum}}';
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
bibkey = 'VegaMexi1997'; type = 'Article'; bib = [ ... 
'author = {M.E. Vega-Cendejas and G. Mexicano-Cintora and A. M. Arce}, ' ... 
'year = {1997}, ' ...
'title = {Biology of the thread herring \emph{Opisthonema oglinum} ({P}isces: {C}lupeidae) from a beach seine fishery of the {C}ampeche Bank, Mexico}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {30}, ' ...
'pages = {117-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Opisthonema-oglinum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  
