  function [data, auxData, metaData, txtData, weights] = mydata_Schizothorax_richardsonii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Schizothorax_richardsonii'; 
metaData.species_en = 'Common snowtrout'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2018 12 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 15]; 

%% set data
% zero-variate data
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'JoshDas2016'; 
data.Li = 60;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Shodhganga';
  comment.Wwb = 'Computed from egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwi = 2350;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.97, see F1';
    
data.R13  = 463/365;   units.R13  = '#/d'; label.R13  = 'maximum reprod rate at TL 13.5 cm ';     bibkey.R13  = 'JoshDas2016';   
  temp.R13 = C2K(12);  units.temp.R13 = 'K'; label.temp.R13 = 'temperature';
  comment.R13 = 'based on 16552 eggs/kg for TL 135 mm, using length-weight conversion of F1';
data.R20  = 2942/365;   units.R20  = '#/d'; label.R20  = 'maximum reprod rate at TL 20.5 cm ';     bibkey.R20  = 'JoshDas2016';   
  temp.R20 = C2K(12);  units.temp.R20 = 'K'; label.temp.R20 = 'temperature';
  comment.R20 = 'based on 30408 eggs/kg for TL 205 mm, using length-weight conversion of F1';

% univariate data

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
    1    5.8
    2   59.74   %   65.5
    3  173.35   %  237.9
    4  394.57   %  632.4
    5  659.43]; % 1591.0
data.tW(:,1) = 365 * data.tW(:,1);
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(12);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SingShar1995';
comment.tW = 'Table 2 actually says weight increments, but this is inconsistent with other data; it is hard to believe that a slender fish of 50 cm weighs 1.5 kg';

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 10.22
    2 20.47
    3 29.62
    4 39.14
    5 47.99];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SingShar1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VDBM'; % Cat of Life
metaData.links.id_ITIS = '690083'; % ITIS
metaData.links.id_EoL = '205334'; % Ency of Life
metaData.links.id_Wiki = 'Schizothorax_richardsonii'; % Wikipedia
metaData.links.id_ADW = 'Schizothorax_richardsonii'; % ADW
metaData.links.id_Taxo = '186977'; % Taxonomicon
metaData.links.id_WoRMS = '1018368'; % WoRMS
metaData.links.id_fishbase = 'Schizothorax-richardsonii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Schizothorax_richardsonii}}';  
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
bibkey = 'SingShar1995'; type = 'article'; bib = [ ...  
'author = {D. Singh and R. C. Sharrna}, ' ...
'year = {1995}, ' ...
'title = {Age and growth of a {H}imalayan teleost \emph{Schizothorax richardsonii} ({G}ray) from the {G}arhwal {H}ills ({I}ndia)}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {24}, '...
'pages = {321-329}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoshDas2016'; type = 'article'; bib = [ ...  
'author = {K.D. Joshi and S.C.S. Das and A.U. Khan and R.K. Pathak and U.K. Sarkar}, ' ...
'year = {2016}, ' ...
'title = {Reproductive  Biology  of  Snow  Trout, \emph{Schizothorax  richardsonii} ({G}ray, 1832)  in  a  Tributary  of  River  {A}laknanda,  {I}ndia  and Their  Conservation Implications}, ' ... 
'journal = {International Journal of Zoological Investigations}, ' ...
'volume = {2}, '...
'pages = {109-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Schizothorax-richardsonii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shodhganga'; type = 'Misc'; bib = ...
'howpublished = {\url{http://shodhganga.inflibnet.ac.in/bitstream/10603/68389/14/14_chapter 7.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

