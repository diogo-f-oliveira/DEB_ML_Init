function [data, auxData, metaData, txtData, weights] = mydata_Polypterus_senegalus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polypteriformes'; 
metaData.family     = 'Polypteridae';
metaData.species    = 'Polypterus_senegalus'; 
metaData.species_en = 'Senegal bichir'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFe'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCv'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ah_T'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 05 24];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 05 24]; 

%% set data
% zero-variate data;
data.ah28= 56/24;      units.ah28 = 'd';       label.ah28 = 'age at birth';             bibkey.ah28 = 'BartGemb1997';    
  temp.ah28 = C2K(28); units.temp.ah28 = 'K'; label.temp.ah28 = 'temperature';
data.ah25 = 79/24;      units.ah25 = 'd';       label.ah25 = 'age at birth';             bibkey.ah25 = 'BartGemb1997';    
  temp.ah25 = C2K(25); units.temp.ah25 = 'K'; label.temp.ah25 = 'temperature';
data.am = 34*365;  units.am = 'd';      label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;    units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '15 to 23 cm';
data.Li = 70;      units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = 'for P.s.senegalus; P.s.merionalis grows to 110 cm';

data.Wwb = 6.4e-3;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BartGemb1997';
  comment.Wwb = 'based on egg diameter of 2.3 mm: pi/6*0.23^3';
data.Wwi = 1842;   units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00537*Li^3, see F2';

data.Ri  = 487/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.362	12.829
0.622	16.289
1.099	16.046
1.677	20.525
2.154	20.596
2.642	23.029
3.149	22.943
3.587	24.353
4.193	24.186
5.207	25.194];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d','cm'};   label.tL = {'time since birth', 'total length'};  bibkey.tL = 'fao';   
temp.tL = C2K(26); units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'temp is guessed';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'It can breathe atmospheric air using a pair of lungs.';
metaData.bibkey.F1 = 'Wiki';
F2 = 'length weight: Ww in g = 0.00537*(TL in cm)^3';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '77V2Q'; % Cat of Life
metaData.links.id_ITIS = '573243'; % ITIS
metaData.links.id_EoL = '979299'; % Ency of Life
metaData.links.id_Wiki = 'Polypterus_senegalus'; % Wikipedia
metaData.links.id_ADW = 'Polypterus_senegalus'; % ADW
metaData.links.id_Taxo = '42388'; % Taxonomicon
metaData.links.id_WoRMS = '1020652'; % WoRMS
metaData.links.id_fishbase = 'Polypterus-senegalus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polypterus_senegalus}}';   
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
bibkey = 'BartGemb1997'; type = 'Article'; bib = [ ...  
'author = {P. Bartsch and S. Gembells and T. Piotrowski}, ' ...
'year = {1997}, ' ...
'title  = {The embryonic and larval development of \emph{Polypterus senegalus} {C}uvier, 1829: its staging with reference to external and skeletal features, behaviour and locomotory habits}, ' ...
'journal = {Acta Zoologica (Stockholm)}, ', ...
'volume = {78}, '...
'pages = {309-328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/3/t0537e/t0537e06.htm}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Polypterus-senegalus.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  