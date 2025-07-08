function [data, auxData, metaData, txtData, weights] = mydata_Sclerophrys_pentoni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Sclerophrys_pentoni'; 
metaData.species_en = 'Penton''s toad'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 15];

%% set data
% zero-variate data

data.ab = 5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Anaxyrus americanus, temp corrected';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'FranBarb1984';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranBarb1984';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 7.65;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'amphibiaweb';
  comment.Li = '5.8-9.5 cm';
data.Lim  = 7.0;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'amphibiaweb';
  comment.Lim = 'amphibiaweb: 5.4-7.4 cm';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 34.83;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bufo bufo: (7.65/17.5)^3*417';
data.Wwim = 26.7;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi: (7.0/7.65)^3*34.83';
  
data.Ri  = 330/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on Bufo bufo: 1500*92/417';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), SVL (cm): females, males
    1 2.800 2.675 
    2 3.505 3.317
    3 4.011 3.762
    4 4.358 4.089
    5 4.611 4.270];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.6) * 365; % convert LAG to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm   = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_fm = 'FranBarb1984'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 10 * weights.Li;
weights.Lim = 10 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4VQ8Y'; % Cat of Life
metaData.links.id_ITIS = '1104648'; % ITIS
metaData.links.id_EoL = '46396164'; % Ency of Life
metaData.links.id_Wiki = 'Sclerophrys_pentoni'; % Wikipedia
metaData.links.id_ADW = 'Bufo_pentoni'; % ADW
metaData.links.id_Taxo = '5658721'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Sclerophrys+pentoni'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sclerophrys_pentoni}}';
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
bibkey = 'FranBarb1984'; type = 'Article'; bib = [ ... 
'author = {H. Francillon and R. Barbault and J. Castanet  and A. de Ricqles}, ' ... 
'year = {1984}, ' ...
'title = {Etude compl\''{e}mentaire sur la biologie de l''amphibien d\''{e}serticole \emph{Bufo pentoni}: donn\''{e}es de squelettochronologie et d''\''{e}cod\''{e}mographie}, ' ...
'journal = {Revue d''\''{E}cologie (La Terre et La Vie)}, ' ...
'volume = {39(2)}, ' ...
'pages = {209-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46396164}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Sclerophrys+pentoni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

