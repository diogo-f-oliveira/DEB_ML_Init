function [data, auxData, metaData, txtData, weights] = mydata_Notoscopelus_kroyeri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Notoscopelus_kroyeri'; 
metaData.species_en = 'Lancet fish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 02];

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(6.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.2;   units.Lp = 'cm';   label.Lp = 'standard length fat puberty';    bibkey.Lp = 'fishbase';
data.Li = 14.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.3 mm of Lampanyctus_ritteri: pi/6*0.03^3';
data.Wwp = 4.53; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwi = 'based on 0.00437*Lp^3.16, see F1';
data.Wwi = 19.56; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00437*Li^3.16, see F1';

data.Ri = 85e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(6.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1  6.0
    2  9.0
    3 10.5];
data.tL(:,1) = (data.tL(:,1) + 0.2) * 365; % convert yr to f
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(6.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MazhFili1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00437*(SL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '47YQ6'; % Cat of Life
metaData.links.id_ITIS = '623879'; % ITIS
metaData.links.id_EoL = '51604824'; % Ency of Life
metaData.links.id_Wiki = 'Notoscopelus_kroyeri'; % Wikipedia
metaData.links.id_ADW = 'Notoscopelus_kroyeri'; % ADW
metaData.links.id_Taxo = '181458'; % Taxonomicon
metaData.links.id_WoRMS = '272728'; % WoRMS
metaData.links.id_fishbase = 'Notoscopelus-kroyeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notoscopelus_kroyeri}}';
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
bibkey = 'MazhFili1987'; type = 'article'; bib = [ ...
'author = {G. P. Mazhirina and A. A. Filin}, ' ... 
'year   = {1987}, ' ...
'title  = {Gonad Development and Spawning of \emph{Notoscopelus kr{/o}yeri} in the {N}orthwest {A}tlantic, with Observations on Other Biological Characteristics}, ' ...
'journal = {J. Northw. Atl. Fish. Sci.}, ' ...
'page = {99-106}, ' ...
'volume = {7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Notoscopelus-kroyeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

