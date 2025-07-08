function [data, auxData, metaData, txtData, weights] = mydata_Phrynosoma_douglasii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Phrynosoma_douglasii'; 
metaData.species_en = 'Pygmy short-horned lizard'; 

metaData.ecoCode.climate = {'BSk', 'BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 14];

%% set data
% zero-variate data

data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'idaho';
  temp.tp = C2K(35); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty';  bibkey.tpm = 'idaho';
  temp.tpm = C2K(35); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = '';   
  temp.am = C2K(35); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.8;   units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'Laht2010';
data.Wwp = 10;   units.Wwp = 'g';  label.Wwp = 'wet at puberty for females'; bibkey.Wwp = 'Laht2010';
data.Wwi = 36;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'Mont1983';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(35);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 till 15 eggs/clutch; 1 clutch per yr assumed';
  
% univariate data
data.tW = [ ... % time (d), weight (g)
 0  1.17
 1  2.48
 3  4.15
 4  5.88
 5 10.81
 6 16.60
 7 20.74
 8 23.85
 9 25.41
10 27.92
11 29.31];    
% t-Ww data
data.tW(:,1) = data.tW(:,1) * 30.5; % convert mnth to d
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(35);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mont1983';
comment.tW = 'Data for non-hibernating group';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0; % unconsistent with Wwp data, given tW
weights.tW = 5 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'tp ignored, due to inconsistency of (tp,Wwp) with tW data';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'natmap'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GWSQ'; % Cat of Life
metaData.links.id_ITIS = '564567'; % ITIS
metaData.links.id_EoL = '47193312'; % Ency of Life
metaData.links.id_Wiki = 'Phrynosoma_douglasii'; % Wikipedia
metaData.links.id_ADW = 'Phrynosoma_douglasii'; % ADW
metaData.links.id_Taxo = '49015'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Phrynosoma&species=douglasii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phrynosoma_douglasii}}';
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
bibkey = 'Mont1983'; type = 'Article'; bib = [ ... 
'author = {R. R. Montanucci}, ' ... 
'year = {1984}, ' ...
'title = {Breeding, captice care and longevity of the short-horned lizard \emph{Phrynosoma douglassi}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {23}, ' ...
'pages = {148--156}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laht2010'; type = 'phdthesis'; bib = [ ... 
'author = {M. E. Lahti}, ' ... 
'year = {2010}, ' ...
'title = {THE STATUS OF DWARFED POPULATIONS OF SHORT-HORNED LIZARDS (\emph{Phrynosoma hernandesi}) AND {G}REAT {P}LAINS TOADS (\emph{Anaxyrus cognatus}) IN THE {S}AN {L}UIS {V}ALLEY, {C}OLORADO}, ' ...
'school = {Utah State University}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/2819760/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'natmap'; type = 'Misc'; bib = ...
'howpublished = {\url{http://naturemappingfoundation.org/natmap/facts/short-horned_lizard_712.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'idaho'; type = 'Misc'; bib = ...
'howpublished = {\url{http://idahoherps.pbworks.com/w/page/8133227/Phrynosoma douglasii44 Short-horned lizard}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


