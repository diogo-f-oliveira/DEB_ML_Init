function [data, auxData, metaData, txtData, weights] = mydata_Notobalanus_flosculus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Sessilia'; 
metaData.family     = 'Archaeobalanidae';
metaData.species    = 'Notobalanus_flosculus'; 
metaData.species_en = 'Barnacle'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW', 'MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 09]; 

%% set data
% zero-variate data

data.am = 8*365;   units.am = 'd';      label.am = 'life span';                          bibkey.am = 'guess';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.05;    units.Lj  = 'cm';    label.Lj  = 'basal diameter at metam';          bibkey.Lj  = 'VeneClac2005';
data.Lp  = 0.284;    units.Lp  = 'cm';    label.Lp  = 'opercule diameter at puberty';    bibkey.Lp  = 'VeneClac2005';
data.Li  = 0.623;    units.Li  = 'cm';    label.Li  = 'ultimate opercule diameter';      bibkey.Li  = 'VeneClac2005';

data.Wwb = 9e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                   bibkey.Wwb = 'VeneClac2005';
  comment.Wwb = 'Based on egg diameter of 0.120 mm: pi/6*0.012^3';
data.Wwi = 2;    units.Wwi = 'g';   label.Wwi = 'ultimate soma wet weight';           bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on Amphibalanus_amphitrite';

data.Ri  = 1.7e6/ 365;    units.Ri  = '#/d';   label.Ri  = 'reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';

% uni-variate data

% tL-data
data.tL = [  ... % time since settlement (d), opercule diameter (cm)
13.907	0.069
46.637	0.118
88.855	0.219
116.560	0.269
141.772	0.335
175.742	0.371
208.906	0.266
226.039	0.402
237.889	0.333
264.902	0.333
300.119	0.362
335.266	0.335
408.810	0.368];
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'opercule diameter'};  
temp.tL    = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VeneClac2005';
comment.tL = 'Data from Ushuaia Harbour; Temperature 4.2 C in July, 9.8 C in Jan';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'kap_R is set at 0.95/2, since the species is hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '58569576'; % Ency of Life 
metaData.links.id_Wiki = 'Archaeobalanidae'; % Wikipedia
metaData.links.id_ADW = 'Notobalanus'; % ADW
metaData.links.id_Taxo = '1330572'; % Taxonomicon
metaData.links.id_WoRMS = '733530'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notobalanus}}';
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
bibkey = 'VeneClac2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-005-0219-5}, ' ...
'author = {Leonardo A. Venerus and Javier A. Calcagno and Gustavo A. Lovrich and Daniel E. Nahabedian}, ' ... 
'year = {2005}, ' ...
'title = {Differential growth of the barnacle \emph{Notobalanus flosculus} ({A}rchaeobalanidae) onto artificial and live substrates in the {B}eagle {C}hannel, {A}rgentina}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {59}, ' ...
'pages = {196-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
