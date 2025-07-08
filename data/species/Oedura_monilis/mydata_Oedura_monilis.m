function [data, auxData, metaData, txtData, weights] = mydata_Oedura_monilis

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Diplodactylidae';
metaData.species    = 'Oedura_monilis';
metaData.species_en = 'Ocellated velvet gecko';

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 09];

%% set data
% zero-variate data;
data.ab = 31;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'guess';
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'for eggs laid on 13 june, 51 d for eggs laid on 4 april';
data.am = 17*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3.5; units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Bust1971';  
  comment.Lb = 'TL 5.8-6 cm';
data.Lp  = 6.8;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Bust1971';  
data.Li  = 9.2;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';    bibkey.Li  = 'Bust1971';
data.Lim  = 8.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'Bust1971';

data.Wwb = 0.95; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bust1971';
  comment.Wwb = 'based on "just under 1 g"';
data.Wwi = 13; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Bust1971';
temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs per clutch, 2 clutches per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), SVL (cm)
59.720	4.014
213.664	4.850
301.051	6.042
365+28.832	6.029
365+28.933	5.843
365+181.083	6.240
365+209.898	6.802
365+209.951	6.703
365+210.723	6.528
365+269.594	7.860
365+331.440	7.449
365+483.857	7.353
365+576.793	7.054
365+606.082	7.989];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bust1971'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '48WXL'; % Cat of Life
metaData.links.id_ITIS = '818961'; % ITIS
metaData.links.id_EoL = '794044'; % Ency of Life
metaData.links.id_Wiki = 'Oedura_monilis'; % Wikipedia
metaData.links.id_ADW = 'Oedura_monilis'; % ADW
metaData.links.id_Taxo = '48914'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Oedura&species=monilis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oedura_monilis}}';   
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
bibkey = 'Bust1971'; type = 'Article'; bib = [ ...
'author = {H. Robert Bustard}, ' ...
'title = {A Population Study of the Eyed Gecko, \emph{Oedura ocellata} {B}oulenger, in {N}orthern {N}ew {S}outh {W}ales, {A}ustralia}, ' ...
'journal = {Copeia}, ' ...
'volume = {1971(4)}, ' ...
'pages = {658-669}, ' ...
'year = {1971}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794044}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

