function [data, auxData, metaData, txtData, weights] = mydata_Noturus_albater

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_albater'; 
metaData.species_en = 'Ozark madtom'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 10 13]; 

%% set data
% zero-variate data;

data.ab = 8+7;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'MaydBroo1980';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 8 d, yolk sack resporbtion at 7 d post hatch';
data.am = 3*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'MaydBroo1980';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 7.3;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'MaydBroo1980';
data.Li  = 12;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 2.76e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MaydBroo1980'; 
  comment.Wwb = 'based on egg diameter of 3.75 mm: pi/6*0.375^3';
data.Wwi = 12.74; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';
   
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0.5 5.30
    1.5 7.58
    2.5 8.48];
data.tL(:,1) = (0 + data.tL(:,1) * 365); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaydBroo1980';

% length fecundity
data.LN = [ ... % total length (cm)
    7.71 109
    7.85 110
    8.13 116];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MaydBroo1980';

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

%% Discussion points
D1 = 'Males are assumed not to differ from fenales';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '47ZMD'; % Cat of Life
metaData.links.id_ITIS = '164006'; % ITIS
metaData.links.id_EoL = '208011'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_albater'; % Wikipedia
metaData.links.id_ADW = 'Noturus_albater'; % ADW
metaData.links.id_Taxo = '181561'; % Taxonomicon
metaData.links.id_WoRMS = '1012746'; % WoRMS
metaData.links.id_fishbase = 'Noturus-albater'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_albater}}';
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
bibkey = 'MaydBroo1980'; type = 'article'; bib = [ ...  
'author = {Richard L. Mayden and Brooks  M. Burr and Sharon L. Dewey}, ' ...
'year = {1980}, ' ...
'title = {Aspects of the Life History of the {O}zark Madtom, \emph{Noturus albater}, in Southeastern {M}issouri ({P}isces: {I}ctaluridae)}, ' ... 
'journal = {The American Midland Naturalist}, '...
'volume = {104(2)}, ' ...
'pages = {335-340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-albater.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

