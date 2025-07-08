function [data, auxData, metaData, txtData, weights] = mydata_Gobiesox_rhessodon

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiesociformes'; 
metaData.family     = 'Gobiesocidae';
metaData.species    = 'Gobiesox_rhessodon'; 
metaData.species_en = 'California clingfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMi', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 05];

%% set data
% zero-variate data

data.ab = 16;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(22.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(22.5);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Well1979'; 
data.Li  = 6.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Runy1961';
  comment.Wwb = 'based on egg legnth of 0.96 mm and width of  0.77 mm of Gobiesox strumosus: pi/6*0.096*0.077^2';
data.Wwi = 3.23;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.15, see F1';
 
% univariate data
% time - length
data.tL = [ ... % time (d), std length (cm)
  0 3.1	
 60 3.3
120 3.5];
data.tL(:,1) = 590 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(22.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Well1979'; 
    
% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
2.800	229.992
2.997	189.544
3.197	194.545
3.205	142.707
3.390	280.469
3.491	321.150
3.499	169.314
3.789	313.200
3.902	145.670
3.987	350.022
4.088	384.338];
units.LN = {'cm', '#'}; label.LN = {'std length', 'fecundity'};  
temp.LN = C2K(22.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Well1979'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

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
F1 = 'length-weight: Ww in g  = 0.00933* (TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GP6G'; % Cat of Life
metaData.links.id_ITIS = '164464'; % ITIS
metaData.links.id_EoL = '164464'; % Ency of Life
metaData.links.id_Wiki = 'Gobiesox'; % Wikipedia
metaData.links.id_ADW = 'Gobiesox_rhessodon'; % ADW
metaData.links.id_Taxo = '175222'; % Taxonomicon
metaData.links.id_WoRMS = '275679'; % WoRMS
metaData.links.id_fishbase = 'Gobiesox-rhessodon'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobiesox}}';
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
bibkey = 'Well1979'; type = 'Article'; bib = [ ... 
'author = {Wells, A.W.}, ' ... 
'year = {1979}, ' ...
'title = {Notes on the life history of the {C}alifornia clingfish, \emph{Gobiesox rhessodon} ({G}obiesociformes, {G}obiesocidae)}, ' ...
'journal = {Calif. Fish Game}, ' ...
'volume = {65(2)}, ' ...
'pages = {106-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Runy1961'; type = 'Article'; bib = [ ... 
'author = {Suzanne Runyan}, ' ... 
'year = {1961}, ' ...
'title = {Early Development of the Clingfish, \emph{Gobiesox strumosus} {C}ope}, ' ...
'journal = {Chesapeake Science}, ' ...
'volume = {2(3-4)}, ' ...
'pages = {113-142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Gobiesox-rhessodon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

