function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_bendimahiensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_bendimahiensis'; 
metaData.species_en = 'Bendimahi lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 13];

%% set data
% zero-variate data

data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'YildKuml2019';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'YildKuml2019';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.55;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on D. valentini ';
data.Li  = 7.2;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'YildKuml2019';  

data.Wwi = 6.14;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lacerta strigata';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
 3	3.877
 4	4.229
 4	4.320
 4	3.676
 4	5.010
 4	5.062
 4	5.192
 4	5.218
 4	3.799
 4	4.021
 4	4.808
 4	4.756
 4	5.348
 5	5.387
 5	5.849
 5	4.925
 5	4.971
 5	5.504
 5	5.543
 5	5.752
 6	5.335
 6	5.420
 6	5.517
 7	5.745
 7	6.110
 7	6.311];
data.tL(:,1) = (data.tL(:,1)-1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YildKuml2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'LAGs reduced with 1 to match tL and Li';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'This species is a hybrid of D. raddei (maternal) and D. valentini (paternal)';
metaData.bibkey.F1 = 'YildKuml2019'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3462D'; % Cat of Life
metaData.links.id_ITIS = '1155313'; % ITIS
metaData.links.id_EoL = '791766'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_bendimahiensis'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_bendimahiensis'; % ADW
metaData.links.id_Taxo = '642523'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=bendimahiensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_bendimahiensis}}';
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
bibkey = 'YildKuml2019'; type = 'Article'; bib = [ ... 
'doi = {10.3897/herpetozoa.32.e37094}, ' ...
'author = {Elif Y{\i}ld{\i}r{\i}m and Yusuf Kumluta\c{s} and Kamil Candan and \c{C}etin Ilgaz}, ' ... 
'year = {2019}, ' ...
'title = {Age structure and body size of the endangered species \emph{Darevskia bendimahiensis} ({S}chmidtler, {E}iselt \& {D}arevsky, 1994) from eastern {T}urkey ({S}quamata, {S}auria, {L}acertidae)}, ' ...
'journal = {Herpetozoa}, ' ...
'volume = {32}, ' ...
'pages = {159–163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791766}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
