function [data, auxData, metaData, txtData, weights] = mydata_Channa_striata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Channidae';
metaData.species    = 'Channa_striata'; 
metaData.species_en = 'Striped snakehead'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biCvf','biCva'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 09 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 12]; 

%% set data
% zero-variate data

data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Li and tL; Kila1986 could distinguish 6 yr classes';

data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Kila1986';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 48.7; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp =  {'fishbase','Kila1986'};
   comment.Wwp = 'relationship 0.00513*(10*Lp)^3.14 (see F1)';
data.Wwi = 9.25e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','Kila1986'};
   comment.Wwi = 'relationship 6.1103e-6*(10*Li)^3.06 (see F1)';

data.Ri  = 16486/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
    1 13.6
    2 19.4
    3 25.6
    4 30.5
    5 36.8
    6 37.4];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kila1986';

  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight Ww in g = 6.1103e-6 * (TL in mm)^3.06';
metaData.bibkey.F1 = 'Kila1986'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TM4H'; % Cat of Life
metaData.links.id_ITIS = '166667'; % ITIS
metaData.links.id_EoL = '205160'; % Ency of Life
metaData.links.id_Wiki = 'Channa_striata'; % Wikipedia
metaData.links.id_ADW = 'Channa_striata'; % ADW
metaData.links.id_Taxo = '170532'; % Taxonomicon
metaData.links.id_WoRMS = '280130'; % WoRMS
metaData.links.id_fishbase = 'Channa-striata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Channa_striata}}';
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
bibkey = 'Kila1986'; type = 'Article'; bib = [ ... 
'author = {R. V. Kilambi}, ' ... 
'year = {1986}, ' ...
'title = {Age, growth and reproductive strategy of the snakehead, \emph{Ophicephalus striatus} {B}loch, from {S}ri {L}anka}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {29}, ' ...
'pages = {13-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Channa-striata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

