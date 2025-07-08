function [data, auxData, metaData, txtData, weights] = mydata_Sternotherus_odoratus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Sternotherus_odoratus'; 
metaData.species_en = 'Common musk turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 03];

%% set data
% zero-variate data

data.ab = 67;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'ADW';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '60-84 dWiki: 100-150 d';
data.tp = 3.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = {'ADW','AnAge'};   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 54.8*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.3;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';         bibkey.Lb  = 'Erns1986'; 
data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'Wiki';
data.Lim = 12;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'guess';
  comment.Lim = 'based on "males are somewhat smaller than fe,males" (Wiki)';

data.Wwi = 472; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'EoL';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = {'Wiki','ADW'};   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-9  eggs per clutch, 2 or more clutch per yr';
 
% uni-variate data
% length-spec growth rate
data.tL = [ ... % time since birth (yr), carapace length(0) (cm)
 0	2.307
 1	3.296
 2	4.094
 3	4.876
 4	5.294
 5	6.045
 6	6.716
 7	7.022
 8	7.439
 9	7.730
10	8.036];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL   = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erns1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

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
D1 = 'Males are assumed to differ from females by {p_Am}  only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Males are born at T = 25-26 C, females at T <24 and >27 C';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52FT3'; % Cat of Life
metaData.links.id_ITIS = '173758'; % ITIS
metaData.links.id_EoL = '790517'; % Ency of Life
metaData.links.id_Wiki = 'Sternotherus_odoratus'; % Wikipedia
metaData.links.id_ADW = 'Sternotherus_odoratus'; % ADW
metaData.links.id_Taxo = '48319'; % Taxonomicon
metaData.links.id_WoRMS = '1486615'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sternotherus&species=odoratus'; % ReptileDB
metaData.links.id_AnAge = 'Sternotherus_odoratus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sternotherus_odoratus}}';
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
bibkey = 'Erns1986'; type = 'Article'; bib = [ ... 
'author = {Carl H. Ernst}, ' ... 
'year = {1986}, ' ...
'title = {Ecology of the Turtle, \emph{Sternotherus odoratus}, in Southeastern {P}ennsylvania}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {20(3)}, ' ...
'pages = {341-352}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sternotherus_odoratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/790517}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sternotherus_odoratus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

