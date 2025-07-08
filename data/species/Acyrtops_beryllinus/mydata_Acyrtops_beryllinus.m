function [data, auxData, metaData, txtData, weights] = mydata_Acyrtops_beryllinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiesociformes'; 
metaData.family     = 'Gobiesocidae';
metaData.species    = 'Acyrtops_beryllinus'; 
metaData.species_en = 'Emerald clingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMi', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 07];

%% set data
% zero-variate data

data.ab = 16;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.5);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.4;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 2.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.4e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Goul1965';
  comment.Wwb = 'based on egg length of 1.2 mm, width of  0.9 mm, height 0.6 mm: pi/6*0.12*0.09*0.06';
data.Wwi = 0.11;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00617*Li^3.15, see F1';

data.Ri = 130/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'Goul1965';
  temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time - length
data.tL = [ ... % time(d), std length (cm)
0.227	0.705
26.422	0.947
61.343	1.294
91.546	1.498
121.511	1.655];
data.tL(:,1) = data.tL(:,1) + 25;
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Goul1965'; comment.tL = 'growth in laboratory';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
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
D1 = 'males are assumed not to differ from females';     
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00617*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9WQV'; % Cat of Life
metaData.links.id_ITIS = '164472'; % ITIS
metaData.links.id_EoL = '46566448'; % Ency of Life
metaData.links.id_Wiki = 'Acyrtops'; % Wikipedia
metaData.links.id_ADW = 'Acyrtops_beryllinus'; % ADW
metaData.links.id_Taxo = '160146'; % Taxonomicon
metaData.links.id_WoRMS = '279504'; % WoRMS
metaData.links.id_fishbase = 'Acyrtops-beryllinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acyrtops}}';
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
bibkey = 'Goul1965'; type = 'Article'; bib = [ ... 
'author = {Gould, W.R.}, ' ... 
'year = {1965}, ' ...
'title = {The biology and morphology of \emph{Acyrtops beryllinus}, the Emerald clingfish}, ' ...
'journal = {Bull. Mar. Sci.}, ' ...
'volume = {15(1)}, ' ...
'pages = {165-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acyrtops-beryllinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

