function [data, auxData, metaData, txtData, weights] = mydata_Fundulopanchax_gardneri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Nothobranchiidae';
metaData.species    = 'Fundulopanchax_gardneri'; 
metaData.species_en = 'Blue lyretail'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ww_t'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 19]; 

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'protropicals';   
  temp.ab = C2K(23.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 13.5*7;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'protropicals';
  temp.tp = C2K(23.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 0.8*365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'protropicals';   
  temp.am = C2K(23.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ArimOfoj2004';  
data.Li  = 3;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'protropicals';
data.Lim  = 6.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';
data.L32  = 2.02;    units.L32  = 'cm';  label.L32  = 'total length at 32 d';    bibkey.L32  = 'ArimOfoj2004';
  temp.L32 = C2K(24.2);  units.temp.L32 = 'K'; label.temp.L32 = 'temperature'; 

data.Wwb = 2.4e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ArimOfoj2004';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwi = 0.26;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = {'protropicals','fishbase'};
  comment.Wwi = 'based on 0.0141 * Li^2.649, see F1';
data.Wwim = 2.00;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = {'protropicals','fishbase'};
  comment.Wwim = 'based on  0.0141 * Lim^2.649, see F1';
data.Ww32  = 8.79e-2;    units.Ww32  = 'g';  label.Ww32  = 'wet weight at 32 d';  bibkey.Ww32  = 'ArimOfoj2004';
  temp.Ww32 = C2K(24.2);  units.temp.Ww32 = 'K'; label.temp.Ww32 = 'temperature'; 
 
data.Ri = 14*30/365;    units.Ri = '#/d'; label.Ri = 'life span';                    bibkey.Ri = 'ArimOfoj2004';   
  temp.Ri = C2K(23.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '30 eggs/d over (guessed) 14 d';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weight.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww = 0.0141 * (TL in cm)^2.649';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'This species is a faculcutatively annual';
metaData.bibkey.F2 = 'CuiMedei2019'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6JRTC'; % Cat of Life
metaData.links.id_ITIS = '646985'; % ITIS
metaData.links.id_EoL = '216582'; % Ency of Life
metaData.links.id_Wiki = 'Fundulopanchax_gardneri'; % Wikipedia
metaData.links.id_ADW = 'Fundulopanchax_gardneri'; % ADW
metaData.links.id_Taxo = '387240'; % Taxonomicon
metaData.links.id_WoRMS = '1013634'; % WoRMS
metaData.links.id_fishbase = 'Fundulopanchax-gardneri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulopanchax_gardneri}}';
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
bibkey = 'ArimOfoj2004'; type = 'Article'; bib = [ ... 
'author = {Arimoro, F. O. and Ofojekwu, P. C.}, ' ... 
'year = {2003/2004}, ' ...
'title = {Incidence of feeding, growth and survival of the toothed carp, \emph{Aphyosemion gardneri} larvae reared on the freshwater rotifer, \emph{Brachionus calyciflorus}}, ' ...
'journal = {Tropical Freshwater biology}, ' ...
'volume = {12/13}, ' ...
'pages = {35--43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/9739}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'protropicals'; type = 'Misc'; bib = ...
'howpublished = {\url{http://protropicals.com/fundulopanchax-gardneri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CuiMedei2019'; type = 'Article'; bib = [ ... 
'author = 	 {Rongfeng Cui and Tania Medeiros and David Willemsen and Leonardo N.M. Iasi and Glen E. Collier and Martin Graef and Martin Reichard and Dario Riccardo Valenzano}, '...
'title = 	 {Relaxed Selection Limits Lifespan by Increasing Mutation Load}, ' ...
'Journal =  {Cell}, ' ...
'year = 	   2019, ' ...
'volume =   179, ' ...
'pages =    {385–399}, '...
'doi = {10.1016/j.cell.2019.06.004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


