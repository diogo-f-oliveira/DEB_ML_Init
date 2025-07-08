function [data, auxData, metaData, txtData, weights] = mydata_Prionotus_carolinus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Prionotus_carolinus'; 
metaData.species_en = 'Northern searobin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.9); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 29];

%% set data
% zero-variate data
data.ab = 7.7;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(20.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 3.7 d, start feeding assumed at 7.7 d';
data.am = 9*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';  
  temp.am = C2K(18.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 38;    units.Li = 'cm';   label.Li = 'ultimate total length';          bibkey.Li = 'fishbase';

data.Wwb = 6.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05  mm: pi/6*0.105^3';
data.Wwp = 61.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00513*Lp^3.19, see F1';
data.Wwi = 562; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00513*Li^3.19, see F1';

data.Ri = 180e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'Yusc1985';
  temp.Ri = C2K(18.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on P. evolans';

% uni-variate data
% time-length
data.tL_CN = [ ... % age (years) ~ Length (cm) 
    0 NaN   7.5
    1 12.6 13.0
    2 16.3 19.5
    3 18.0 22.0
    4 19.7 24.5
    5 20.4 25.5
    6 21.1 27.0];
data.tL_CN(:,1) = 365 * (0.8+data.tL_CN(:,1)); % convert yr to d
units.tL_CN = {'d', 'cm'}; label.tL_CN = {'time since birth', 'total length'};  
treat.tL_CN = {1, {'Chesapeak','New England'}};
temp.tL_CN = C2K(18.9);  units.temp.tL_CN = 'K'; label.temp.tL_CN = 'temperature';
bibkey.tL_CN = 'McBr2002';

%% set weights for all real data
weights = setweights(data, []);

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00513*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MGG2'; % Cat of Life
metaData.links.id_ITIS = '166974'; % ITIS
metaData.links.id_EoL = '46568730'; % Ency of Life
metaData.links.id_Wiki = 'Prionotus_carolinus'; % Wikipedia
metaData.links.id_ADW = 'Prionotus_carolinus'; % ADW
metaData.links.id_Taxo = '154127'; % Taxonomicon
metaData.links.id_WoRMS = '159571'; % WoRMS
metaData.links.id_fishbase = 'Prionotus-carolinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionotus_carolinus}}';
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
bibkey = 'McBr2002'; type = 'article'; bib = [ ...
'author = {Richard S. McBride}, ' ... 
'year   = {2002}, ' ...
'title  = {Spawning, growth, and overwintering size of searobins ({T}riglidae: \emph{Prionotus carolinus} and \emph{P. evolans})}, ' ...
'journal = {Fishery Bulletin}, ' ...
'page = {641-647}, ' ...
'volume = {100(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Yusc1985'; type = 'article'; bib = [ ...
'author = {Paul Yuschak}, ' ... 
'year   = {1985}, ' ...
'title  = {Fecundity, Eggs, Larvae and Osteological Development of the Striped Searobin, (\emph{Prionotus evolans}) ({P}isces, {T}riglidae))}, ' ...
'journal = {J Northw Atl Fish. Sci}, ' ...
'page = {65-85}, ' ...
'volume = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Prionotus-carolinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

