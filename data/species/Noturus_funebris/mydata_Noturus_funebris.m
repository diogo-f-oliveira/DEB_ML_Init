function [data, auxData, metaData, txtData, weights] = mydata_Noturus_funebris

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_funebris'; 
metaData.species_en = 'Black madtom'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 11 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 11 14]; 

%% set data
% zero-variate data;

data.am = 4.5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'BennKuha2008';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 8;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'Based on value for Noturus phaeus';
data.Li  = 15;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 3.35e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BennKuha2008'; 
  comment.Wwb = 'based on egg diameter of 2.94 mm: pi/6*0.4^3';
data.Wwi = 25.4; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';
   
data.Ri = 108.8/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'BennKuha2008';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
    0  4.4
    1  6.8
    2  8.4
    3 10.8
    4 11.97];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.86; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BennKuha2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from fenales';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575 *(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.86*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZMQ'; % Cat of Life
metaData.links.id_ITIS = '164014'; % ITIS
metaData.links.id_EoL = '220791'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_funebris'; % Wikipedia
metaData.links.id_ADW = 'Noturus_funebris'; % ADW
metaData.links.id_Taxo = '181569'; % Taxonomicon
metaData.links.id_WoRMS = '1019580'; % WoRMS
metaData.links.id_fishbase = 'Noturus-funebris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_funebris}}';
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
bibkey = 'BennKuha2008'; type = 'article'; bib = [ ...  
'doi = {10.1080/02705060.2008.9664213}, ' ...
'author = {Micah G. Bennett and Bernard R. Kuhajda}, ' ...
'year = {2008}, ' ...
'title = {Life History Aspects of the Black Madtom, \emph{Noturus funebris} ({S}iluriformes: {I}ctaluridae), in the {C}ahaba {R}iver {D}rainage, {C}entral {A}labama, {U}{S}{A}}, ' ... 
'journal = {Journal of Freshwater Ecology}, '...
'volume = {23(3)}, ' ...
'pages = {365-372}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-funebris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

