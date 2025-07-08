function [data, auxData, metaData, txtData, weights] = mydata_Sclerophrys_pardalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Sclerophrys_pardalis'; 
metaData.species_en = 'Eastern leopard toad'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 14];

%% set data
% zero-variate data

data.ab = 8;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Anaxyrus americanus';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;  units.tpm = 'd';    label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'guess';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'CherFran1992';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 12.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';
data.Lim  = 11.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'guess';
  comment.Lim = 'based on "females are a little larger than males"';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on Anaxyrus americanus';
data.Wwi = 118;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bufo bufo: (11.5/17.5)^3*417';
data.Wwim = 92;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi: (11.5/12.5)^3*118';
  
data.Ri  = 424/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on Bufo bufo: 1500*118/417';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), SVL (cm): females, males
1	NaN     9.216
1	NaN     9.812
1	NaN    10.419
1	NaN     8.520
1	NaN     9.407
2	10.848  8.848
2	10.339  8.410
2	10.096  9.725
2	12.039  8.725
2	11.819 10.916
2   NaN     9.612
2   NaN     9.522
2   NaN     9.028
3	10.511 10.537
3	11.435 11.211
3	9.794  10.222
3	11.932 NaN
5	10.923 NaN
5	12.218 NaN
6	11.129 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9) * 365; % convert LAG to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm   = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_fm = 'CherFran1992'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4VQ8X'; % Cat of Life
metaData.links.id_ITIS = '1103443'; % ITIS
metaData.links.id_EoL = '47056108'; % Ency of Life
metaData.links.id_Wiki = 'Sclerophrys_pardalis'; % Wikipedia
metaData.links.id_ADW = 'Amietophrynus_pardalis'; % ADW
metaData.links.id_Taxo = '5658720'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Sclerophrys+pardalis'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sclerophrys_pardalis}}';
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
bibkey = 'CherFran1992'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1992.tb04431.x}, ' ...
'author = {Cherry, M. I. and Francillon-Vieillot, H.}, ' ... 
'year = {1992}, ' ...
'title = {Body size, age and reproduction in the leopard toad, \emph{Bufo pardalis}}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {228(1)}, ' ...
'pages = {41–50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/47056108}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Sclerophrys+pardalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

