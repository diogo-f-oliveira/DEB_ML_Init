function [data, auxData, metaData, txtData, weights] = mydata_Parvilacerta_parva
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Parvilacerta_parva'; 
metaData.species_en = 'Dwarf lizard'; 

metaData.ecoCode.climate = {'BSk', 'Csa','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 06];

%% set data
% zero-variate data

data.ap = 2.5*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'guess';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'YakiGurk2012';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.1;  units.Lb  = 'cm'; label.Lb  = 'SVL at birth'; bibkey.Lb  = 'guess';  
  comment.Lb = 'based on Podarcis_muralis: 2.2*5.9/6.2 cm';
data.Li  = 5.9;  units.Li  = 'cm'; label.Li  = 'ultimate SVL'; bibkey.Li  = 'YakiGurk2012';  

data.Wwi = 5.69 ;  units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Podarcis_muralis: 5 eggs per season';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), femur bone layer (mum)
4	4.701
4	4.808
5	5.020
5	5.246
6	5.364
6	5.385
6	5.139
6	5.253
6	5.347
6	5.108
6	5.188
8	5.716
8	5.875];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d','cm'};  label.tL = {'time since birth','SVL'};  
temp.tL  = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YakiGurk2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6TSXY'; % Cat of Life
metaData.links.id_ITIS = '1155333'; % ITIS
metaData.links.id_EoL = '456983'; % Ency of Life
metaData.links.id_Wiki = 'Parvilacerta_parva'; % Wikipedia
metaData.links.id_ADW = 'Parvilacerta_parva'; % ADW
metaData.links.id_Taxo = '1685276'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Parvilacerta&species=parva'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parvilacerta_parva}}';
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
bibkey = 'YakiGurk2012'; type = 'Article'; bib = [ ... 
'author = {Batuhan Yaman Yakin and Mert G\"{u}rkan and Sibel Hayretda\u{g} and Cemal Varol Tok}, ' ... 
'year = {2012}, ' ...
'title = {Preliminary Data on Age Estimation and Body Size of the Dwarf Lizard, \emph{Parvilacerta parva} ({B}oulenger, 1887) ({R}eptilia: {L}acertilia) from Ak\c{s}ehir, {K}onya ({T}urkey)}, ' ...
'journal = {Ecologia Balkanica}, ' ...
'pages = {331-336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/456983}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Parvilacerta&species=parva}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
