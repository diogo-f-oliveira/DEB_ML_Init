function [data, auxData, metaData, txtData, weights] = mydata_Pagrus_auriga

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagrus_auriga'; 
metaData.species_en = 'Redbanded seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCim', 'biCic'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 01 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 03]; 



%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 25*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'PajuMart2006';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 38.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'PajuSoco2006';  
  comment.Lp = '53.3 cm for males';
data.Li  = 80;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwi = 4.68e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0086*Li^3.014, see F2';

data.GSI  = 0.02; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'PajuSoco2006';   
temp.GSI = C2K(19); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (mm)
   1 163 
   2 177 
   3 213 
   4 290 
   5 324 
   6 357 
   7 379 
   8 402 
   9 439 
  10 474 
  11 481 
  12 518 
  13 533 
  14 558 
  15 571 
  16 579 
  17 588 
  18 627    
  19 685 
  20 760 
  22 721 
  24 781];
data.tL(:,1) = (0.75 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PajuMart2006';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temeratures are guessed';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Protogynous hermaphroditic';
metaData.bibkey.F1 = 'PajuSoco2006'; 
F2 = 'length-weight: Ww in g = 0.0086*(TL in cm)^3.014; PajuSoco2006 acutally say TL in mm, but this must be incorrect';
metaData.bibkey.F2 = 'PajuSoco2006'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4BZMX'; % Cat of Life
metaData.links.id_ITIS = '647960'; % ITIS
metaData.links.id_EoL = '46579970'; % Ency of Life
metaData.links.id_Wiki = 'Pagrus'; % Wikipedia
metaData.links.id_ADW = 'Pagrus_auriga'; % ADW
metaData.links.id_Taxo = '182494'; % Taxonomicon
metaData.links.id_WoRMS = '127061'; % WoRMS
metaData.links.id_fishbase = 'Pagrus-auriga'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagrus}}';
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
bibkey = 'PajuMart2006'; type = 'Article'; bib = [ ... 
'author = {Jos\''{e} G. Pajuelo and Iciar Mart\''{i}nez and Jos\''{e} A. Gonz\''{a}lez and Jos\''{e} M. Lorenzo and Antonio Garc\''{i}a-Mederos and Rosa Dom\''{i}nguez-Seoane and Carmen M. Hern\''{a}ndez-Cruz}, ' ... 
'year = {2006}, ' ...
'title = {Growth pattern and age estimation of the coastal sparid fish \emph{Pagrus auriga} on the {C}anary {I}slands shelf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {82}, ' ...
'pages = {7-13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PajuSoco2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2006.00748.x}, ' ...
'author = {J. G. Pajuelo and J. Socorro and J. A. Gonz\''{a}lez and J. M. Lorenzo and J. A. P\''{e}rez-Penalvo and I. Mart\''{i}nez and C. M. Hern\''{a}andez-Cruz}, ' ... 
'year = {2006}, ' ...
'title = {Life history of the red-banded seabream \emph{Pagrus auriga} ({S}paridae) from the coasts of the {C}anarian archipelago}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {22}, ' ...
'pages = {430-436}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pagrus-auriga.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
