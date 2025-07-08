function [data, auxData, metaData, txtData, weights] = mydata_Bairdiella_chrysoura
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Bairdiella_chrysoura'; 
metaData.species_en = 'Goldtail croaker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 19];

%% set data
% zero-variate data

data.tp = 95;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = {'HildCabl1930','fishbase'};
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 32*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.3;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.7e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.48 mm: pi/6*0.148^3';
data.Wwp = 11;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^3.08, see F1';
data.Wwi = 407;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.08, see F1';

data.GSI  = 0.12; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'PereSalg2022';   
  temp.GSI = C2K(23); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.896	0.332
31.354	3.891
62.708	7.662
93.167	9.261
122.729	12.278
149.604	11.614
180.063	14.359
214.104	12.549
240.979	14.721
272.333	16.350
302.792	20.513
332.354	19.729];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HildCabl1930';
comment.tL = 'based on max values';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01148*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '68B7Q'; % Cat of Life
metaData.links.id_ITIS = '169259'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Bairdiella_chrysoura'; % Wikipedia
metaData.links.id_ADW = 'Bairdiella_chrysoura'; % ADW
metaData.links.id_Taxo = '162829'; % Taxonomicon
metaData.links.id_WoRMS = '159303'; % WoRMS
metaData.links.id_fishbase = 'Bairdiella-chrysoura'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bairdiella_chrysoura}}';
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
bibkey = 'HildCabl1930'; type = 'article'; bib = [ ...  
'author = {Hildebrand, S. F. and L. E. Cable}, ' ...
'year = {1930}, ' ...
'title = {Development and life history of fourteen teleostean fishes at {B}eaufort, {N}orth {C}arolina}, ' ... 
'journal = {Bull. U.S. Bur. Fish.}, ' ...
'volume = {43}, ' ...
'pages = {383–488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PereSalg2022'; type = 'article'; bib = [ ...  
'doi = {10.23880/izab-16000384}, ' ...
'author = {Perez-Hernandez, M.A. and Salgado-Ugarte, I.H. and Saito-Quezada, V.M. and Pacheco-Marin, R. and Chirino-Gonzalez, A. }, ' ...
'year = {2022}, ' ...
'title = {Reproduction and Condition Indices-Body Structures Adjusted Means Comparison of Silver Perch (\emph{Bairdiella chrysoura}) from {T}ampamachoco {L}agoon, {N}ortheastern {M}exico}, ' ... 
'journal = {International Journal of Zoology and Animal Biology}, ' ...
'volume = {5(3)}, ' ...
'pages = {383–488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bairdiella_chrysoura.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

