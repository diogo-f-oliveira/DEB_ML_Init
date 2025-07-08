function [data, auxData, metaData, txtData, weights] = mydata_Eucinostomus_argenteus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Eucinostomus_argenteus'; 
metaData.species_en = 'Silver mojarra'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW', 'MPE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 03];

%% set data
% zero-variate data;

data.ab = 2.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'SilvSant2014';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 12.8;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 21.2; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 6.55e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Gerres_oyena: pi/6*0.05^3';
data.Wwp = 25.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.08, see F1';
data.Wwi = 119;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.08, see F1';

data.Ri  = 1e5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Gerris equulus';
  
% uni-variate data
% time-length
data.tL = [ ...    % time since birth (yr), total length (cm)
74.018	0.150
104.625	1.908
134.145	3.076
165.118	4.702
195.732	5.869
226.360	5.983
258.062	7.610
288.319	8.185
318.927	9.811
365+14.075	11.159
365+44.691	12.129
365+73.487	12.967
1460+257.090	26.211]; 
data.tL(:,1) = data.tL(:,1)-74; % set origin to birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SilvSant2014';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00977*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BTKG'; % Cat of Life
metaData.links.id_ITIS = '169015'; % ITIS
metaData.links.id_EoL = '46580879'; % Ency of Life
metaData.links.id_Wiki = 'Eucinostomus_argenteus'; % Wikipedia
metaData.links.id_ADW = 'Eucinostomus_argenteus'; % ADW
metaData.links.id_Taxo = '174211'; % Taxonomicon
metaData.links.id_WoRMS = '159732'; % WoRMS
metaData.links.id_fishbase = 'Eucinostomus-argenteus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eucinostomus_argenteus}}';
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
bibkey = 'SilvSant2014'; type = 'article'; bib = [ ... 
'author = {Jos\''{e} Paulo do Carmo Silva and Rosa da Silva Santos and Marcus Rodrigues da Costa and Francisco Gerson Araujo}, ' ... 
'year = {2014}, ' ...
'title = {GROWTH PARAMETERS AND MORTALITY OF \emph{Eucinostomus argenteus} ({B}aird \& {G}irard, 1854) CAPTURED IN {G}UARATIBA MANGROVE, {S}EPETIBA {B}AY, {R}{J}}, ' ...
'journal = {Bol. Inst. Pesca, S\~{a}o Paulo}, ' ...
'volume = {40(4)}, ' ...
'pages = {657–667}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Eucinostomus-argenteus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
