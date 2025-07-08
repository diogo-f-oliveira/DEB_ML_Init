function [data, auxData, metaData, txtData, weights] = mydata_Agonus_cataphractus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Agonidae';
metaData.species    = 'Agonus_cataphractus'; 
metaData.species_en = 'Hooknose'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 05];

%% set data
% zero-variate data
data.ab = 30; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(9.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: eggs take long to hatch';
data.am = 3*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.2);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 6;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'Gall1969';
data.Li = 21;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 2.17;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Gall1969';
  comment.Wwp = 'based on 0.01023*Lp^2.99, see F1';
data.Wwi = 92;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.99, see F1';
 
data.GSI = 0.10; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Gall1969';
  temp.GSI = C2K(9.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
0.007	0.923
0.416	2.901
0.748	5.507
0.995	6.014
1.256	6.437
1.419	6.943
1.998	9.007
2.259	9.514
2.414	9.558
2.746	9.731
3.240	10.451
3.416	10.50];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(9.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gall1969';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'B29V'; % Cat of Life
metaData.links.id_ITIS = '167454'; % ITIS
metaData.links.id_EoL = '46568882'; % Ency of Life
metaData.links.id_Wiki = 'Agonus_cataphractus'; % Wikipedia
metaData.links.id_ADW = 'Agonus_cataphractus'; % ADW
metaData.links.id_Taxo = '45006'; % Taxonomicon
metaData.links.id_WoRMS = '127190'; % WoRMS
metaData.links.id_fishbase = 'Agonus-cataphractus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Agonus_cataphractus}}';  
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
bibkey = 'Gall1969'; type = 'Article'; bib = [ ...
'author = {J. le Gall}, ' ...
'year = {1969}, ' ...
'title = {Croissance d''un poisson t\''{e}l\''{e}osteen, l''\emph{Agonus cataphractus} ({L}inn\''{e}). {R}apports aves le cycle sexuel et la cycle de l''acticit\''{e} throidienne}, ' ... 
'journal = {Vie et Milieu}, ' ...
'volume = {20(1)A}, '...
'pages = {153-234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Agonus-cataphractus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

