function [data, auxData, metaData, txtData, weights] = mydata_Otolithoides_biauritus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Otolithoides_biauritus'; 
metaData.species_en = 'Bronze croaker'; 

metaData.ecoCode.climate = {'A','MA'};
metaData.ecoCode.ecozone = {'TPi','MI','MPSW'};
metaData.ecoCode.habitat = {'0jFl', 'jiFr', 'piMc'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 18];

%% set data
% zero-variate data

data.am = 30*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(28.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 93;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'GhosMoha2009'; 
data.Li  = 160;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'GhosMoha2009';
  comment.Wwb = 'based on egg diameter of 0.79 mm: pi/6*0.079^3';
data.Wwp = 5.4e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','GhosMoha2009'};
  comment.Wwp = 'based on 0.00676*Lp^3.00, see F1';
data.Wwi = 27.7e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.00, see F1';

data.Ri = 1941400/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'GhosMoha2009';   
  temp.Ri = C2K(28.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 13.8
    2 23.4
    3 39.3
    4 45.5
    5 61.5
    6 80.3];
data.tL(:,1) = (data.tL(:,1)-0.6)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kutt1961';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00676*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4B7FP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Otolithoides_biauritus'; % Wikipedia
metaData.links.id_ADW = 'Otolithoides_biauritus'; % ADW
metaData.links.id_Taxo = '502676'; % Taxonomicon
metaData.links.id_WoRMS = '281949'; % WoRMS
metaData.links.id_fishbase = 'Otolithoides-biauritus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otolithoides_biauritus}}';
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
bibkey = 'Kutt1961'; type = 'article'; bib = [ ...
'author = {Narayanan Kutty}, ' ...
'year   = {1961}, ' ...
'title  = {Scales and otoliths of the "Koth" \emph{Otolithoides brunneus} ({D}ay) as age indicator}, ' ... 
'journal = {Ind. J. Fish.}, ' ...
'page = {145-151}, ' ...
'volume = {8(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GhosMoha2009'; type = 'article'; bib = [ ...
'author = {Shubhadeep Ghosh and G. Mohanraj and P. K. Asokan and H. K. Dhokia and M. S. Zala and H. M. Bhint}, ' ...
'year   = {2009}, ' ...
'title  = {Trophodynamics and reproductive biology of \emph{Otolithoides biauritus} ({C}antor) landed by trawlers at {V}anakbara, {D}iu along the west coast of {I}ndia}, ' ... 
'journal = {ndian J. Fish.}, ' ...
'page = {261-265}, ' ...
'volume = {56(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Otolithoides-biauritus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

