  function [data, auxData, metaData, txtData, weights] = mydata_Brevoortia_tyrannus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Brevoortia_tyrannus'; 
metaData.species_en = 'Atlantic menhaden'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr', 'jpFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 09];

%% set data
% zero-variate data
data.ab = 11; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(13.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'DurbDurb1988';   
  temp.am = C2K(13.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 50;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.5e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm of Brevoortia patronus: pi/6*0.095^3';
data.Wwp = 215.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Li^3.10, see F1';
data.Wwi = 1848;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.10, see F1';

data.Ri  = 631000/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(13.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since hatch (yr), total length (cm), weight (g)
    1 11.42  24.1
    2 16.39  78.4
    3 18.66 119.4
    4 21.46 186.9
    5 23.67 260.6
    6 25.20 319.5];
data.tLW(:,1) = 365 * (0.8 + data.tLW(:,1));
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
  temp.tLW = C2K(13.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
  treat.tLW = {1 {'total length','weight'}};
bibkey.tLW = 'DurbDurb1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 3;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;
weights.ab = weights.ab * 0;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Weights Wwi and Wwp are ignored due to inconsistency with tW versus tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.10';  
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5WQZY'; % Cat of Life
metaData.links.id_ITIS = '161732'; % ITIS
metaData.links.id_EoL = '46562447'; % Ency of Life
metaData.links.id_Wiki = 'Brevoortia_tyrannus'; % Wikipedia
metaData.links.id_ADW = 'Brevoortia_tyrannus'; % ADW
metaData.links.id_Taxo = '164634'; % Taxonomicon
metaData.links.id_WoRMS = '158691'; % WoRMS
metaData.links.id_fishbase = 'Brevoortia-tyrannus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Brevoortia_tyrannus}}';  
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
bibkey = 'DurbDurb1988'; type = 'article'; bib = [ ...  
'author = {Ann Gall Durbin and Edward G. Durbin and Thomas J. Smayda and Peter G. Verity}, ' ...
'year = {1988}, ' ...
'title = {AGE, SIZE, GROWTH, AND CHEMICAL COMPOSITION OF {A}TLANTIC MENHADEN, \emph{Brevoortia tyrannus}, FROM {N}ARRAGANSETT {B}AY, {R}HODE {I}SLAND}, ' ... 
'journal = {Fishery Bulletin}, ' ...
'volume = {81(1)}, ' ...
'pages = {133-141}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Brevoortia-tyrannus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  