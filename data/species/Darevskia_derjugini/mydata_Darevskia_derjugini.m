function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_derjugini
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_derjugini'; 
metaData.species_en = 'Artvin lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 06];

%% set data
% zero-variate data

data.ap = 4.2*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'AltuEksi2020';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AltuEksi2020';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.25;  units.Lb  = 'cm'; label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'AltuEksi2020'; 
data.Li  = 6.23;  units.Li  = 'cm'; label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'AltuEksi2020';  
data.Lim = 6.98;  units.Lim = 'cm'; label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'AltuEksi2020';  

data.Wwb = 0.26;  units.Wwb = 'g';  label.Wwb = 'ultimate wet '; bibkey.Wwb = 'AltuEksi2020';
  comment.Wwb = '0.23-0.28 g';
data.Wwi = 6.61;  units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-8 eggs per clutch, 1 cluth per yr';

% univariate data
% time-length
data.tL_Hfm = [ ... % time since birth (yr), SVL (cm)
0	2.257 2.271
3	4.906 4.020
3	4.835 NaN
3	4.478 NaN
3	4.563 NaN
4	5.094 4.422
4	4.965 4.551
4	4.808 NaN
4	4.722 NaN
4	4.622 NaN
5	5.124 4.896
5	5.267 4.639
5	5.210 4.782
5   5.553 NaN
6	5.441 5.327
7	5.329 NaN];
data.tL_Hfm(:,1) = data.tL_Hfm(:,1) * 365; % convert yr to d
units.tL_Hfm  = {'d', 'cm'};  label.tL_Hfm = {'time since birth', 'SVL'};  
temp.tL_Hfm   = C2K(18.9);  units.temp.tL_Hfm = 'K'; label.temp.tL_Hfm = 'temperature';
bibkey.tL_Hfm = 'AltuEksi2020'; treat.tL_Hfm = {1,{'female','male'}};
label.treat.tL_Hfm = 'Highland pop Murgul'; metaData.subtitle.treat.tL_Lfm = 'Highland pop Murgul';
%
data.tL_Lfm = [ ... % time since birth (yr), SVL (cm)
0	2.274 2.137
2   NaN   4.292
2   NaN   4.032
3	4.863 4.671
3	4.767 4.438
3	4.589 NaN
3	4.370 NaN
4	4.804 4.434
4	4.900 4.502
4	5.078 NaN
4	4.995 NaN
4	4.612 NaN
5	4.922 4.333
5	5.018 4.881
5	5.128 NaN
5	5.265 NaN
5	5.374 NaN
6	5.014 5.164
6	5.438 NaN];
data.tL_Lfm(:,1) = data.tL_Lfm(:,1) * 365; % convert yr to d
units.tL_Lfm  = {'d','cm'};  label.tL_Lfm = {'time since birth','SVL'};  
temp.tL_Lfm   = C2K(19.8);  units.temp.tL_Lfm = 'K'; label.temp.tL_Lfm = 'temperature';
bibkey.tL_Lfm = 'AltuEksi2020'; treat.tL_Lfm = {1,{'female','male'}};
label.treat.tL_Lfm = 'Lowand pop Findikli'; metaData.subtitle.treat.tL_Lfm = 'Lowand pop Findikli';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Hfm = 5 * weights.tL_Hfm;
weights.tL_Lfm = 5 * weights.tL_Lfm;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3462Q'; % Cat of Life
metaData.links.id_ITIS = '1155326'; % ITIS
metaData.links.id_EoL = '1056202'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_derjugini'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_derjugini'; % ADW
metaData.links.id_Taxo = '642529'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=derjugini'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_derjugini}}';
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
bibkey = 'AltuEksi2020'; type = 'Article'; bib = [ ... 
'doi = {10.1163/15707563-bja10025}, ' ...
'author = {Altun{\i}\c{s}{\i}k, Abdullah and Eksilmez, Halit}, ' ... 
'year = {2020}, ' ...
'title = {Age, growth and survival rate in two populations of \emph{Darevskia derjugini} ({N}ikolsky, 1898) from different altitudes ({S}quamata: {S}auria: {L}acertidae)}, ' ...
'journal = {Animal Biology}, ' ...
'pages = {1–15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1056202}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
